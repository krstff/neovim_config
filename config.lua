-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar" -- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
vim.opt.relativenumber = true -- set relative numbered lines
lvim.builtin.dap.active = true

lvim.builtin.terminal.open_mapping = "<C-/>"
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
--lvim.keys.normal_mode["<C-,>"] = ": ToggleTerm direction=float <CR>"
lvim.keys.normal_mode["<C-r>"] = ":w<CR>:RunCode <CR>"
lvim.keys.normal_mode["<C-t>"] = ":w <CR> :split term ./tests <cr>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Additional Plugins
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

lvim.plugins = {
  "tpope/vim-surround",
  'MunifTanjim/nui.nvim',
  'ThePrimeagen/vim-be-good',
  'AckslD/swenv.nvim',
  'mfussenegger/nvim-dap-python',
  "mfussenegger/nvim-jdtls",
  'CRAG666/code_runner.nvim',
  'CRAG666/betterTerm.nvim',
  'mg979/vim-visual-multi',
}

--Python
-- Setup dap for python
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function() require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python") end)

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
pcall(function() require("dap-python").test_runner = "pytest" end)

-- Mappings
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
lvim.builtin.which_key.vmappings["d"] = {
  name = "Debug",
  s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
}

require('betterTerm').setup {
  prefix = "Term_",
  startInserted = true,
  position = "bot",
  size = 18
}
-- use the best keymap for you
-- change 1 for other terminal id
-- Change "get_filetype_command()" to "get_project_command().command" for running projects
vim.keymap.set("n", "<C-.>", function()
  require("betterTerm").send(require("code_runner.commands").get_filetype_command(), 1,
    { clean = false, interrupt = true })
end, { desc = "Excute File" })
