
return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telekasten").setup {
        home = 'c:/Users/rowens04/Documents/Notes/',
        template_new_daily = 'c:/Users/rowens04/Documents/Notes/templates/daily.md',
        template_new_weekly = 'c:/Users/rowens04/Documents/Notes/templates/weekly.md',

        plug_into_calendar = true,
        calendar_opts = {
          weeknm = 4,
          calendar_monday = 0,
          calendar_mark = 'left-fit',
        },
      }
    end,
    keys = {
      { "<leader>z", "<cmd>Telekasten panel<CR>", desc = "Telekasten Panel" },
      { "<leader>zc", "<cmd>Telekasten show_calendar<CR>", desc = "Show Calendar" },
      { "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", desc = "Insert Image Link" },
      { "<leader>zd", "<cmd>Telekasten goto_today<CR>", desc = "Goto Today's Note" },
      { "<leader>zw", "<cmd>Telekasten goto_thisweek<CR>", desc = "Goto This Week's Note" },
      { "<leader>zS", "<cmd>Telekasten search_notes<CR>", desc = "Search Notes" },
      {"<leader>zf", "<cmd>Telekasten find_notes<CR>", desc = "Find Notes" },

    },

  },
  {
    "itchyny/calendar.vim",
    cmd = { "Calendar", "CalendarVR" },
  },
