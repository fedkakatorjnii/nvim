-- stylua: ignore
-- if true then return {} end

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        -- shaded blocky
        -- terrace
        -- https://patorjk.com/software/taag/#p=display&f=ANSI+Shadow&t=katorjniy&x=none&v=4&h=4&w=80&we=false
        -- ANSI Shadow
        header = [[
██╗  ██╗ █████╗ ████████╗ ██████╗ ██████╗      ██╗███╗   ██╗██╗██╗   ██╗
██║ ██╔╝██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗     ██║████╗  ██║██║╚██╗ ██╔╝
█████╔╝ ███████║   ██║   ██║   ██║██████╔╝     ██║██╔██╗ ██║██║ ╚████╔╝ 
██╔═██╗ ██╔══██║   ██║   ██║   ██║██╔══██╗██   ██║██║╚██╗██║██║  ╚██╔╝  
██║  ██╗██║  ██║   ██║   ╚██████╔╝██║  ██║╚█████╔╝██║ ╚████║██║   ██║   
╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝   
]],
        --         ]],
        --        header = [[
        --        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        --        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
        --        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
        --        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
        --        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
        --        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
        -- ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { 
            -- icon = " ",
            -- icon = "",
            icon = "",
            key = "d",
            desc = "File borwser",
            action = function ()
              require("telescope").extensions.file_browser.file_browser({
                path = "%:p:h",
                select_buffer = true,
                initial_mode = "normal",
              })
            end
          },
          { icon = " ", key = "b", desc = "Data Bases TODO: не работает...", action = ":DBUI" },
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          -- { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
