setlocal foldmethod=syntax
setlocal spell
setlocal textwidth=80

" Insert markdown reference-style link
function! s:AddMarkdownReferenceLink() " {{
  call inputsave()
  let refLink = input("Reference label: ")
  call inputrestore()
  execute "normal f]a[".refLink."]"
  let l = line(".")
  let c = col(".")
  " Could just use ]<Space> from unimpared, but let's try to avoid
  " dependencies (bindings need Surround.vim, anyway)
  normal! Go
  normal! "+p
  execute "normal! >>I[" . refLink . "]: "
  call cursor(l, c)
endfunction

function! s:AddMarkdownReferenceLinkSel(type)
  let sel_save = &selection
  let &selection = "inclusive"

  if a:type == 'line'
    silent execute "normal '[V']S]"
  elseif a:type == 'block'
    silent execute "normal `[\<C-V>`]S]"
  else
    silent execute "normal `[v`]S]"
  endif
  let &selection = sel_save
  call <SID>AddMarkdownReferenceLink()
endfunction
" }}

" Underline the current line with "=" signs
map <buffer> <leader>_ yypVr=
map <buffer> <leader>1 I# $ #<CR><CR><Esc>
map <buffer> <leader>2 I## $ ##<CR><CR><Esc>
map <buffer> <leader>3 I### $ ###<CR><CR><Esc>
" Wrap the next word as a markdown link
nmap <buffer> <leader>[ :set opfunc=<SID>AddMarkdownReferenceLinkSel<CR>g@
nmap <buffer> <leader>[[ <leader>[iw
vmap <buffer> <leader>[ S]:call <SID>AddMarkdownReferenceLink()<CR>
imap <buffer> <C-l> <Esc>b<leader>[a
