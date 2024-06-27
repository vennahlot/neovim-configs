return {
  config_sonar = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          vim.fn.expand('$MASON/bin/sonarlint-language-server'),
          "-stdio",
          "-analyzers",
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        },
      },
      filetypes = {
        "python",
        "cpp",
        "java",
      },
    })
  end
}
