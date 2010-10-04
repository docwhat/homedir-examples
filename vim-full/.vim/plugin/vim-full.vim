" Has this already been loaded?
if exists("loaded_my_vim_full")
  finish
endif
let loaded_my_vim_full = 1


" list -- shows spaces, tabs and EOL characters
" listchars sets the characters to show as placeholders
"   eol:c
"   tab:xy
"   trail:c
"   extends:c
"   precedes:c
set list
set listchars=tab:»·,trail:·


" Mail niftyness
" Automatically place the cursor onto the first line of the mail body:
"  autocmd BufRead .followup,.article,.letter :normal 1G}j
autocmd BufRead mutt-* set autoindent expandtab list textwidth=68
autocmd BufRead mutt-* :normal 1G}j
"
" Condense multiple "Re:_" to just one "Re:" in Subject lines:
if(v:version >= 600)
  map <Leader>re 1G/^Subject:<CR>:s/\(Re: \)\+/Re: /<CR>
else
  map ,re 1G/^Subject:<CR>:s/\(Re: +\)\+/Re: /<CR>
endif
