local local_plugins = {
	--{
	--    "vim-guys",
	--    dir = "~/personal/vim-guys",
	--    config = function()
	--    end,
	--},
	--{
	--    "cockpit",
	--    dir = "~/personal/cockpit",
	--    config = function()
	--        require("cockpit")
	--        vim.keymap.set("n", "<leader>ct", "<cmd>CockpitTest<CR>")
	--        vim.keymap.set("n", "<leader>cr", "<cmd>CockpitRefresh<CR>")
	--    end,
	--},


	{
		"cursor_agent",
		dir = "~/personal/cursor_in_neovim/",
		dependencies = { "nvim-lua/plenary.nvim" }, -- optional, improves HTTP; falls back to curl if absent
		config = function()
			require("cursor_agent").setup({
				-- optional config
				ui = {
					width = 60, -- panel width in columns
					input_height = 3, -- input box height
					border = "rounded",
				},
				provider = {
					name = "openai", -- or "anthropic"
					openai = {
						model = "gpt-4o-mini",
					},
					anthropic = {
						model = "claude-3-5-sonnet-20240620",
						version = "2023-06-01",
						max_tokens = 1024,
					},
				},
			})
		end,
	},

	{
		"streamer",
		dir = "~/personal/eleven-streamer",
		config = function()
			vim.keymap.set("n", "<leader>er", function()
				require("streamer").reload()
			end)
			vim.keymap.set("n", "<leader>es", function()
				require("streamer").twitch_dashboard()
			end)
			vim.keymap.set("n", "<leader>en", function()
				require("streamer").twitch_dashboard():stop()
			end)
		end,
	},



}

return local_plugins
