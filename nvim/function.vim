" LAZYGIT {{{
  function! ToggleLazyGit()
    echo "Loaded Lazygit"
    call ToggleTerm('lazygit')
  endfunction

  nnoremap <silent><leader>ll :call ToggleLazyGit()<cr>
  tnoremap <silent><leader>ll <C-\><C-n>:call ToggleLazyGit()<CR>
" }}}


" CREATE FLOATING WINDOW {{{
  function! CreateCenteredFloatingWindow()
    let width  = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.8)
    let top    = ((&lines - height) / 2) - 1
    let left   = (&columns - width) / 2
    let opts   = { 'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal' }
    let top    = "╭" . repeat("─", width - 2) . "╮"
    let mid    = "│" . repeat(" ", width - 2) . "│"
    let bot    = "╰" . repeat("─", width - 2) . "╯"
    let lines  = [top] + repeat([mid], height - 2) + [bot]
    let s:buf  = nvim_create_buf(v:false, v:true)

    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    call InvertBackground()

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, CreatePadding(opts))
    autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf
    autocmd BufWipeout <buffer> call ResetBackground()
  endfunction

  function! CreatePadding(opts)
    let a:opts.row    += 1
    let a:opts.height -= 2
    let a:opts.col    += 2
    let a:opts.width  -= 4
    return a:opts
  endfunction
" }}}

" TOGGLE TERMINAL && ON TERMINAL EXIT {{{
  function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
      call CreateCenteredFloatingWindow()
      call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
      call feedkeys('i')
    else
      bwipeout!
    endif
  endfunction

  function! OnTermExit(job_id, code, event) dict
    if a:code == 0
      bwipeout!
    endif
  endfunction
" }}}


" INVERT && RESET BACKGROUND {{{
  function! InvertBackground()
    hi InactiveWindow guibg=NONE
    hi ActiveWindow   guibg=#2c323c
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  endfunction

  function! ResetBackground()
    hi ActiveWindow   guibg=NONE
    hi InactiveWindow guibg=#2c323c
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  endfunction
" }}}
