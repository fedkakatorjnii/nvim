return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",

    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },

    opts = {
      defaults = {
        extensions = {
          file_browser = {
            -- theme = "ivy",
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
                -- ["h"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
                -- ["o"] = require("telescope._extensions.file_browser.actions").select_default,
                -- ["t"] = require("telescope._extensions.file_browser.actions").change_cwd,
                -- ["t"] = require("telescope.actions").change_cwd,
                ["t"] = require("telescope").extensions.file_browser.actions.change_cwd,
              },
            },
          },
        },

        -- Пример выбора темы отображения
        theme = "dropdown", -- dropdown, cursor, ivy и т.п.

        -- Настройка стратегии сортировки и расположения
        sorting_strategy = "ascending",
        layout_strategy = "center",

        -- Опции расположения окна поиска
        layout_config = {
          width = 0.8,
          height = 0.4,
          prompt_position = "top",
        },

        -- Отключение или включение превью
        preview = true,

        -- Настройка границ и символов границ окна
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

        -- Дополнительные настройки для отображения
        results_title = false,
        prompt_prefix = "🔍 ",
      },

      pickers = {
        find_files = {
          theme = "dropdown",
        },
        live_grep = {
          theme = "ivy",
        },
      },
    },
  },
}
