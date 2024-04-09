local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- next one requires ripgrep installed
-- which in my case I installed via the os package manager
-- `dnf install ripgrep`
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({
    search = vim.fn.input("Grep > "),
    file_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    grep_open_files = true
  })
end)
