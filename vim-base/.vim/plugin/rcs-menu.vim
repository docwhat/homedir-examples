"  Name Of File: rcs-menu.vim
"   Description: Interface to RCS Version Control.
"    Maintainer: Jeff Lanzarotta (jefflanzarotta at yahoo dot com)
"           URL: http://lanzarott.tripod.com/vim/plugin/6/rcs-menu.vim.zip
"          Date: September 4, 2002
"       Version: 6.0.5
"     Copyright: None.
"         Usage: These command and gui menu displays useful revision control
"                system (rcs) functions. Just drop this plugin in your plugin's
"                directory.
" Configuration: Your rcs executables must be in your path.

" Has this already been loaded?
if exists("loaded_rcs_menu")
  finish
endif

let loaded_rcs_menu = 1

if has("gui")
  amenu Plugin.RCS.Initial\ Check\ In<Tab>,init :!ci -i -u %<Cr>:e!<Cr>
  amenu Plugin.RCS.-SEP1-        <nul>
  amenu Plugin.RCS.Check\ In<Tab>,ci :!ci -u %<Cr>:e!<Cr>
  amenu Plugin.RCS.Check\ Out<Tab>,co :!co %<Cr>:e!<Cr>
  amenu Plugin.RCS.Check\ Out\ (Locked)<Tab>,lock :!co -l %<Cr>:e!<Cr>
  amenu Plugin.RCS.-SEP2-        <nul>
  amenu Plugin.RCS.Revert\ to\ Last\ Version<Tab>,revert :!co -u %<Cr>:e!<Cr>
  amenu Plugin.RCS.-SEP3-        <nul>
  amenu Plugin.RCS.Force\ Lock<Tab>,force :!rcs -l %<Cr>:e!<Cr>
  amenu Plugin.RCS.Break\ Lock<Tab>,break :!rcs -u %<Cr>:e!<Cr>
  amenu Plugin.RCS.-SEP4-        <nul>
  amenu Plugin.RCS.Show\ History<Tab>,log :call RCSShowLog("/rlog", "rlog")<Cr><Cr>
  amenu Plugin.RCS.-SEP5-        <nul>
  amenu Plugin.RCS.Show\ Differences<Tab>,diff :call RCSShowDiff("/rcsdiff", "rcsdiff")<Cr><Cr>
endif

" Mappings:
if(v:version >= 600)
  map <Leader>init    :!ci -i -u %<Cr>:e!<Cr>
  map <Leader>ci      :!ci -u %<Cr>:e!<Cr>
  map <Leader>co      :!co %<Cr>:e!<Cr>
  map <Leader>lock    :!co -l %<Cr>:e!<Cr>
  map <Leader>revert  :!co -u %<Cr>:e!<Cr>
  map <Leader>log     :call RCSShowLog("/rlog", "rlog")<Cr><Cr>
  map <Leader>diff    :call RCSShowDiff("/rcsdiff", "rcsdiff")<Cr><Cr>
  map <Leader>break   :!rcs -u %<Cr>:e!<Cr>
  map <Leader>force   :!rcs -l %<Cr>:e!<Cr>
else
  map ,init           :!ci -i -u %<Cr>:e!<Cr>
  map ,ci             :!ci -u %<Cr>:e!<Cr>
  map ,co             :!co %<Cr>:e!<Cr>
  map ,lock           :!co -l %<Cr>:e!<Cr>
  map ,revert         :!co -u %<Cr>:e!<Cr>
  map ,log            :call RCSShowLog("/rlog", "rlog")<Cr><Cr>
  map ,diff           :call RCSShowDiff("/rcsdiff", "rcsdiff")<Cr><Cr>
  map ,break          :!rcs -u %<Cr>:e!<Cr>
  map ,force          :!rcs -l %<Cr>:e!<Cr>
endif

" RCSShowLog
" Show the log results of the current file with a revision control system.
function! RCSShowLog(bufferName, cmdName)
  call s:ReadCommandInBuffer(a:bufferName, a:cmdName)
endfunction

" RCSShowDiff
" Show the diffs of the current file with a revision control system.
function! RCSShowDiff(bufferName, cmdName)
  call s:ReadCommandInBuffer(a:bufferName, a:cmdName)
endfunction

" RCSBrakeLock
function! RCSBrakeLock(bufferName, cmdName)
  call s:ReadCommandInBuffer(a:bufferName, a:cmdName)
endfunction

" ReadCommandInBuffer
" - bufferName is the name which the new buffer with the command results
"   should have.
" - cmdName is the command to execute.
function! s:ReadCommandInBuffer(bufferName, cmdName)
  " Modify the shortmess option:
  " A  don't give the "ATTENTION" message when an existing swap file is
  "    found.
  set shortmess+=A

  " Get the name of the current buffer.
  let currentBuffer = bufname("%")

  " If a buffer with the name rlog exists, delete it.
  if bufexists(a:bufferName)
    execute 'bd! ' a:bufferName
  endif

  " Create a new buffer.
  execute 'new ' a:bufferName

  " Execute the command.
  execute 'r!' a:cmdName ' ' currentBuffer

  " Make is so that the file can't be edited.
  setlocal nomodified
  setlocal nomodifiable
  setlocal readonly

  " Go to the beginning of the buffer.
  execute "normal 1G"

  " Restore the shortmess option.
  set shortmess-=A
endfunction
