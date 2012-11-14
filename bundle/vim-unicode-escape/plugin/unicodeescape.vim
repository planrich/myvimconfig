function! HTMLEncode()
ruby << EOF
  @str=VIM::Buffer.current.line
  VIM::Buffer.current.line=@str.unpack("U*").collect {|s| (s > 127 ? "&##{s};" : s.chr) }.join("")
EOF
endfunction

nnoremap <Leader>u :call HTMLEncode()<CR>
