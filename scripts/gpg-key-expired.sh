#!/usr/bin/env bash
# https://gist.github.com/TheSherlockHomie/a91d3ecdce8d0ea2bfa38b67c0355d00

set -euo pipefail

RED='\033[0;31m'; YELLOW='\033[1;33m'; GREEN='\033[0;32m'
CYAN='\033[0;36m'; BOLD='\033[1m'; DIM='\033[2m'; RESET='\033[0m'

info()  { printf "${CYAN}==>%b ${BOLD}%s%b\n" "$RESET" "$*" "$RESET"; }
ok()    { printf "${GREEN}✓%b %s\n" "$RESET" "$*"; }
warn()  { printf "${YELLOW}!%b %s\n" "$RESET" "$*"; }
die()   { printf "${RED}✗%b %s\n" "$RESET" "$*" >&2; exit 1; }

ask() {
  local var="$1" msg="$2" default="${3:-}"
  if [[ -n "$default" ]]; then
    printf "${BOLD}%s [%s]: %b" "$msg" "$default" "$RESET"
  else
    printf "${BOLD}%s: %b" "$msg" "$RESET"
  fi
  read -r "$var"
  if [[ -z "${!var}" && -n "$default" ]]; then
    printf -v "$var" '%s' "$default"
  fi
}

confirm() {
  local msg="$1" default="${2:-y}"
  local opts; [[ "$default" == "y" ]] && opts="Y/n" || opts="y/N"
  printf "${BOLD}%s [%s]: %b" "$msg" "$opts" "$RESET"
  local ans; read -r ans
  [[ -z "$ans" ]] && ans="$default"
  [[ "${ans}" =~ ^[Yy]$ ]]
}

copy_to_clipboard() {
  if command -v xclip &>/dev/null; then
    echo "$1" | xclip -selection clipboard && ok "Copied to clipboard (xclip)."
  elif command -v xsel &>/dev/null; then
    echo "$1" | xsel --clipboard --input && ok "Copied to clipboard (xsel)."
  elif command -v wl-copy &>/dev/null; then
    echo "$1" | wl-copy && ok "Copied to clipboard (wl-copy)."
  elif command -v pbcopy &>/dev/null; then
    echo "$1" | pbcopy && ok "Copied to clipboard (pbcopy)."
  else
    warn "No clipboard tool found — copy the key above manually."
  fi
}

list_expired_key_ids() {
  gpg --list-secret-keys --with-colons 2>/dev/null \
    | awk -F: '$1=="sec" && $2=="e" {print $5}'
}

key_uid() {
  gpg --list-secret-keys --with-colons "$1" 2>/dev/null \
    | awk -F: '$1=="uid" {print $10; exit}'
}

get_fingerprint() {
  gpg --list-secret-keys --with-colons --fingerprint "$1" 2>/dev/null \
    | awk -F: '$1=="fpr" {print $10; exit}'
}

main() {
  command -v gpg &>/dev/null || die "gpg is not installed."

  info "GPG Key Renewal"
  echo

  mapfile -t expired_ids < <(list_expired_key_ids)

  if [[ ${#expired_ids[@]} -eq 0 ]]; then
    ok "No expired GPG secret keys found."
    exit 0
  fi

  echo "Expired keys:"
  local i=0
  for kid in "${expired_ids[@]}"; do
    local uid; uid=$(key_uid "$kid")
    printf "  ${BOLD}%d)%b  %s  ${DIM}%s%b\n" $((++i)) "$RESET" "$kid" "$uid" "$RESET"
  done
  echo

  local choice
  if [[ ${#expired_ids[@]} -eq 1 ]]; then
    choice=1
    warn "Only one expired key — selecting it automatically."
    echo
  else
    ask choice "Select key to renew (1-${#expired_ids[@]})"
    [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#expired_ids[@]} )) \
      || die "Invalid selection: $choice"
    echo
  fi

  local keyid="${expired_ids[$((choice-1))]}"
  local uid; uid=$(key_uid "$keyid")
  local fpr; fpr=$(get_fingerprint "$keyid")

  info "Key:         $keyid ($uid)"
  info "Fingerprint: $fpr"
  echo

  # ── step 1: duration ────────────────────────────────────────────────────────
  local duration
  ask duration "New expiry duration (e.g. 1y, 6m, never)" "1y"
  echo

  # ── step 2: primary key ─────────────────────────────────────────────────────
  info "Renewing primary key..."
  gpg --quick-set-expire "$fpr" "$duration"
  ok "Primary key updated."
  echo

  # ── step 3: subkeys ─────────────────────────────────────────────────────────
  if confirm "Renew all subkeys with the same duration?"; then
    info "Renewing all subkeys..."
    gpg --quick-set-expire "$fpr" "$duration" '*'
    ok "All subkeys updated."
    echo
  fi

  # ── step 4: trust ───────────────────────────────────────────────────────────
  if confirm "Set trust level to ultimate (recommended for your own keys)?"; then
    printf "%s:5:\n" "$fpr" | gpg --import-ownertrust
    ok "Trust level set to ultimate."
    echo
  fi

  # ── step 5: export ──────────────────────────────────────────────────────────
  if confirm "Export updated public key?"; then
    local pubkey; pubkey=$(gpg --armor --export "$keyid")
    echo
    echo "$pubkey"
    echo
    copy_to_clipboard "$pubkey"
    echo
    warn "Update your key on GitHub: Settings → SSH and GPG keys"
    local github_url="https://github.com/settings/keys"
    if command -v xdg-open &>/dev/null; then
      xdg-open "$github_url" 2>/dev/null &
    elif command -v open &>/dev/null; then
      open "$github_url" &
    else
      warn "Could not open browser — go to: $github_url"
    fi
    echo
  fi

  # ── step 6: backup ──────────────────────────────────────────────────────────
  if confirm "Create a local backup of your secret keys?" "n"; then
    local backup_file="gpg-backup-${keyid}.pgp"
    local trust_file="gpg-ownertrust-${keyid}.txt"
    info "Writing $backup_file and $trust_file..."
    gpg --output "$backup_file" --armor \
        --export-secret-keys --export-options export-backup "$keyid"
    gpg --export-ownertrust > "$trust_file"
    ok "Backup saved."
    warn "Store these files offline and in a secure location!"
    echo
  fi

  ok "Done! Key $keyid has been renewed."
}

main "$@"
