setlocal makeprg="ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp . $(bundle list --paths)"
