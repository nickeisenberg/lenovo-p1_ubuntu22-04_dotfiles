return {
  'neovim/nvim-lspconfig',
  enabled = true,
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    'folke/neodev.nvim',
  },
  config = function ()
    local on_attach = function(_, bufnr)
      vim.keymap.set(
        'n', '<leader>gd', require('telescope.builtin').lsp_definitions,
        { buffer = bufnr, desc = '[G]oto [D]efinition' }
      )

      vim.keymap.set(
        'n', '<leader>gr', require('telescope.builtin').lsp_references,
        { buffer = bufnr, desc = '[G]oto [D]efinition' }
      )

      vim.keymap.set(
        'n', '<leader>gs', require('telescope.builtin').lsp_document_symbols,
        { buffer = bufnr, desc = '[D]ocument [S]ymbols' }
      )

      vim.api.nvim_buf_create_user_command(
        bufnr,
        'Format',
        function(_)
          vim.lsp.buf.format()
        end,
        { desc = 'Format current buffer with LSP' }
      )
      vim.keymap.set(
        'n', '<leader>F', ":Format<cr>",
        { buffer = bufnr, desc = '[D]ocument [S]ymbols' }
      )
    end
    
    local mason = require("mason")
    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require("lspconfig")

    mason.setup()
    mason_lspconfig.setup()

    local servers = {
      clangd = {},
      pyright = {},
      bashls = {
        filetypes = { "sh", "zsh" }
      },
      sqlls = {},
      texlab = {},
      marksman = {},
      html = { filetypes = { 'html', 'twig', 'hbs', 'htmldjango' } },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }
    
    -- vim api lsp support
    require("neodev").setup()

    local capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end,
    }
  end
}
