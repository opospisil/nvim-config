local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      file_ignore_patterns = { ".bloop/", ".git/", ".cache", "%.o", "%.out", "%.class",
        "%.pdf", "%.mkv", "%.mp4", "%.zip" },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        --theme = "dropdown",
        previewer = true,
        hidden = true,
        layout_config = {
          width = 0.9,
          height = 0.9,
          prompt_position = "bottom",
        },
      },
      live_grep = {
        theme = "dropdown",
        previewer = true,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        layout_config = {
          width = 0.9,
          prompt_position = "top",
        },
      },
      colorscheme = {
        previewer = false,
        theme = "dropdown",
      },
    },
  })
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.3",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = config,
  keys = {
    mapvimkey("<leader>fk", "Telescope keymaps", "Show Keymaps"),
    mapvimkey("<leader>fh", "Telescope help_tags", "Show Help Tags"),
    mapvimkey("<leader>ff", "Telescope find_files", "Find Files"),
    mapvimkey("<leader>fg", "Telescope live_grep", "Live Grep"),
    mapvimkey("<leader>fb", "Telescope buffers", "Find Buffers"),
    vim.keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { noremap = true, silent = true })
  },
}
