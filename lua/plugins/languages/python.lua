return {
  {"mfussenegger/nvim-dap-python",
  ft = {"python"},
  config = function()
    -- pip install debugpy
    require('dap-python').setup('/usr/bin/python3')
    end
  }
}
