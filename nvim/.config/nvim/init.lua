require("josifek")
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'My custom launch configuration',
  program = '${file}',
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})
table.insert(require('dap').configurations.python, {
  name = 'Python attach',
  type = 'python',
  request = 'attach',
  connect = {
      port = 5678
  },
  justMyCode = false
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})
