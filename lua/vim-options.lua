vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set colorcolumn=72")
vim.g.mapleader = " "

vim.cmd("syntax on")
vim.cmd("set nocompatible")
vim.cmd("filetype plugin on")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.conceallevel = 1

vim.opt.cursorline = true
vim.opt.mouse = "a"

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- dont put char in buffer
keymap.set("n", "x", '"_x', opts)

-- modern keybindings
keymap.set("v", "<C-c>", ":w !wl-copy<CR><CR>}", opts)
keymap.set("n", "<C-s>", ":w<CR>", opts)
keymap.set("n", "<Home>", "^", opts)
keymap.set("v", "<Home>", "^", opts)
keymap.set("i", "<Home>", "<C-o>^", opts)
keymap.set("n", "<C-a>", "ggVG", opts)

-- regular bindings for undo redo
keymap.set("n", "<C-z>", "u", opts)
keymap.set("n", "<C-y>", "<C-r>", opts)

-- tab keybindings
keymap.set("n", "<leader><tab>", ":tabnext<CR>", opts)
keymap.set("n", "<leader>s", ":vsplit<CR>", opts)
keymap.set("n", "<C-t>", ":tabnew<CR>", opts)
