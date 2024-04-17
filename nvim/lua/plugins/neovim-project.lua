return {
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/projects/sh/*",
        "~/projects/*",
        "~/projects/test-tasks/*",
        "~/.config/*",
      },
      last_session_on_startup = false,
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
    keys = {
      { "<leader>fP", "<Cmd>Telescope neovim-project discover<CR>", desc = "Projects" },
      { "<leader>fp", "<Cmd>Telescope neovim-project history<CR>", desc = "Recent projects" },
      { "<leader>fS", "<Cmd>NeovimProjectLoadRecent<CR>", desc = "Previous session" },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local projects = {
        action = "Telescope neovim-project discover",
        desc = " Projects",
        icon = " ",
        key = "P",
      }

      local recent_projects = {
        action = "Telescope neovim-project history",
        desc = " Recent projects",
        icon = " ",
        key = "p",
      }

      local previous_session = {
        action = "NeovimProjectLoadRecent",
        desc = " Previous session",
        icon = " ",
        key = "S",
      }

      projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
      projects.key_format = "  %s"

      recent_projects.desc = recent_projects.desc .. string.rep(" ", 43 - #recent_projects.desc)
      recent_projects.key_format = "  %s"

      previous_session.desc = previous_session.desc .. string.rep(" ", 43 - #previous_session.desc)
      previous_session.key_format = "  %s"

      table.insert(opts.config.center, 3, projects)
      table.insert(opts.config.center, 4, recent_projects)
      table.insert(opts.config.center, 5, previous_session)
    end,
  },
}
