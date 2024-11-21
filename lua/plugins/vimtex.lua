return {
  "lervag/vimtex",
  config = function ()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_syntax_enabled = 1
    vim.g.tex_conceal = 'abdmg'
    vim.g.vimtex_quickfix_mode = 0
  end
}
