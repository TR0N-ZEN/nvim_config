
-- https://github.com/williamboman/mason-lspconfig.nvim
local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- https://github.com/williamboman/mason.nvim
-- for installation and configuration of language servers
require('mason').setup({})

-- https://github.com/williamboman/mason-lspconfig.nvim
-- for installation and configuration of language servers
require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls',
    'jdtls',
    'pylsp',
    'yamlls',
    'helm_ls'
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()

      -- TODO why is this happening for other language servers later down below?
      -- get some lanugage server configurations
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- get some lanugage server configurations
require'lspconfig'.pylsp.setup{}
require'lspconfig'.jdtls.setup{}

-- for dockerfile etc language server stuff
-- https://github.com/mrjosh/helm-ls?tab=readme-ov-file#neovim-using-nvim-lspconfig
-- maybe the next line is needed bt for now i only installed it with code inside packer.lua
-- require'towolf/vim-helm'
require'lspconfig'.helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "~/.local/share/nvim/mason/bin/yaml-language-server",
      }
    }
  }
}
-- the nex line seems to be requirement for helm_ls
require'lspconfig'.yamlls.setup {}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-o>'] = cmp.mapping.open_docs(), -- opens docs for the marked item in the completion list window
    ['<C-c>'] = cmp.mapping.close_docs(),
  }),
  view = { docs =  { auto_open = true } },
})
