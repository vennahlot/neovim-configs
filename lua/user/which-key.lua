require("which-key").register({
  ["<leader>"] = { "<cmd>Telescope buffers<cr>", "find buffers" },
  f = {
    name = "+[f]ind",
    b = { "<cmd>Telescope buffers<cr>", "[b]uffers" },
    f = { "<cmd>Telescope find_files<cr>", "[f]iles" },
    r = { "<cmd>Telescope oldfiles<cr>", "[r]ecent files"},
    h = { "<cmd>Telescope help_tags<cr>", "in [h]elp" },
    w = { "<cmd>Telescope grep_string<cr>", "by grep on current [w]ord"},
    g = { "<cmd>Telescope live_grep<cr>", "by [g]rep"},
    d = { "<cmd>Telescope diagnostics<cr>", "[d]iagnostics"},
    c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "[c]urrent buffer" },
  },
  b = {
    "<cmd>DapToggleBreakpoint<cr>", "toggle [b]reakpoint"
  },
  x = {
    name = "+diagnostics",
    x = { "<cmd>TroubleToggle<cr>", "toggle diagnostics" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "[w]orkspace diagnostics" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "[d]ocument diagnostics" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "[q]uickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "[l]ocation list" },
  },
}, { prefix = "<leader>" })
