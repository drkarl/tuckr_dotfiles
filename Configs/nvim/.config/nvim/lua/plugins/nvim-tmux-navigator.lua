return {
    "christoomey/vim-tmux-navigator",
    vim.keymap.set('n', 'C-h', ':TmuixNavigateLeft<CR>'),
    vim.keymap.set('n', 'C-j', ':TmuixNavigateDown<CR>'),
    vim.keymap.set('n', 'C-k', ':TmuixNavigateUp<CR>'),
    vim.keymap.set('n', 'C-l', ':TmuixNavigateRight<CR>')
}
