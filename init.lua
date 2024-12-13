local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/vim-vsnip')
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install()'] })
Plug('junegunn/fzf.vim')
Plug('lifepillar/vim-solarized8')
Plug('mfussenegger/nvim-dap')
Plug('neovim/nvim-lspconfig')
Plug('numToStr/Comment.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn['TSUpdate'] })
Plug('preservim/nerdtree')
Plug('prettier/vim-prettier', { ['do'] = 'npm install --frozen-lockfile --production' })
Plug('tpope/vim-abolish')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-surround')
Plug('windwp/nvim-ts-autotag')
vim.call('plug#end')

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.colorcolumn = "100"

vim.cmd([[colorscheme solarized8]])

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[if ! &bin | silent! %s/\s\+$//ge | endif]]
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit' },
  command = 'set colorcolumn = "72"'
})

-- https://stackoverflow.com/questions/7239192
vim.g.NERDTreeQuitOnOpen = 1

-- vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')
-- https://superuser.com/a/567013
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle %<CR>')

vim.keymap.set('n', '<leader>f', ':GFiles<CR>')
vim.keymap.set('n', '<leader>d', ':Gvdiffsplit!<CR>')

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = { { 'filename', path = 4 } },
    lualine_c = {'diff', 'diagnostics'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "lua",
    "python",
    "sql",
    "typescript",
    "vim",
    "vimdoc",
  },
  indent = {
    enable = true,
    -- disable = { "python" }
  },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = false, -- yup, I find this annoying
  }
}

local lspconfig = require'lspconfig'

require'Comment'.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.keymap.set("n", "<leader>re", "<Plug>(Prettier)", opts)
vim.keymap.set("v", "<leader>re", ":PrettierFragment<cr>", opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- We use Prettier instead
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})

local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  }),
}

local capabilities = require'cmp_nvim_lsp'.default_capabilities()

require'lspconfig'.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.ts_ls.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'OrganizeImports', function()
      vim.lsp.buf.execute_command({
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
      })
    end, { nargs = 0 })

    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n', '<Leader>oi', ':OrganizeImports<CR>',
      { noremap = true, silent = true }
    )
  end,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
}

vim.api.nvim_create_user_command('OrganizeImports', function()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end, { nargs = 0 })

-- require'lspconfig'.eslint.setup {
--   on_attach = function(client, bufnr)
--     vim.api.nvim_buf_create_user_command(bufnr, 'ESLintThis', function()
--       vim.lsp.buf.code_action({ only = {"quickfix"} })
--     end, { nargs = 0 })
--   end,
--   capabilities = capabilities,
-- }
