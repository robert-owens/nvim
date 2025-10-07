return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telekasten").setup({
        home = "C:/Users/YourName/zettelkasten",
        dailies = "C:/Users/YourName/zettelkasten/daily",
        weeklies = "C:/Users/YourName/zettelkasten/weekly",
        templates = "C:/Users/YourName/zettelkasten/templates",
        extension = ".md",
        template_new_note = "new_note.md",
        template_new_daily = "daily.md",
        template_new_weekly = "weekly.md",
        calendar_opts = {
          weeknm = 1,
          calendar_monday = 1,
          calendar_mark = "left-fit",
        },
      })
    end,
    keys = {
      { "<leader>z", "<cmd>Telekasten panel<CR>", desc = "Telekasten Panel" },
      { "<leader>zc", "<cmd>Telekasten show_calendar<CR>", desc = "Show Calendar" },
    },
  },
  {
    "itchyny/calendar.vim",
    cmd = { "Calendar", "CalendarVR" },
  },
}
