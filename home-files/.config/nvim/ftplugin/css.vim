source ~/.config/nvim/ftplugin/_blocking.vim

" remove hyphen ("-") from keyword to allow "select inside word" to capture
" only part of rule names and properties.
setlocal iskeyword-=-
syntax sync fromstart
