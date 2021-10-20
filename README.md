# fugitive-sidekick
A simple nvim plugin to make some futigive plugin features easier to execute (at least for me, there are probably better ways...)

## dependencies
https://github.com/tpope/vim-fugitive

## usage
Currently, these three lua functions are exported to diff modified files in a commit
1. listFilesInCommit - executes ":G difftool --name-only" in a new tab (commit id is fetched from visual selection)
2. diffNext - open next file in quickfix and executes "Gvdiffsplit !^"
3. diffPrev - open previous file in quickfix and executes "Gvdiffsplit !^"
