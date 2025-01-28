return {
  -- "Vigemus/iron.nvim",
  -- dir = "~/gitrepos/iron.nvim/iron.nvim",
  -- dir = "~\\GitRepos\\iron.nvim",
  "nickeisenberg/iron.nvim",
  branch = "dev",
  config = function()
    local iron = require("iron")
    local view = require("iron.view")
    local common = require("iron.fts.common")
    local OS = require("utils").get_os_name()

    iron.setup {
      config = {
        scratch_repl = true,
        repl_open_cmd = {
          toggle_repl_right_DEFAULT = view.split.vertical.rightbelow("%40"),
          toggle_repl_below = view.split.rightbelow("%25")
        },
        repl_definition = {
          python = {
            command = { "ipython", "--no-autoindent" } and OS == "Darwin" or { "python3" },
            format = common.bracketed_paste_python,
            block_deviders = { "# %%", "#%%" },
          }
        },
        repl_filetype = function(_, ft)
          return ft
        end,
      },
      keymaps = {
        toggle_repl = "<space>rr",
        restart_repl = "<space>rR",
        toggle_repl_right = "<space>rv",
        toggle_repl_below = "<space>rh",
        send_line = "<space>sl",
        visual_send = "<space>sp",
        send_paragraph = "<space>sp",
        send_until_cursor = "<space>su",
        send_code_block = "<space>sb",
        send_code_block_and_move = "<space>sn",
        send_file = "<space>sf",
        exit = "<space>rq",
        clear = "<space>rc",
        interrupt = "<space><c-c>",
        cr = "<space><cr>",
      },
      highlight = {
        italic = true
      },
      ignore_blank_lines = true,
    }
  end
}
