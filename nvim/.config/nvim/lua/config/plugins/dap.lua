local M = {}

function M.setup_vstuc()
  local dap = require('dap')
  local vstuc_path = vim.fs.joinpath(vim.env.HOME, "/.vscode/extensions/visualstudiotoolsforunity.vstuc-1.2.0/bin/")

  dap.adapters.vstuc = {
    type = 'executable',
    command = 'dotnet',
    args = {
      vim.fs.joinpath(vstuc_path, 'UnityDebugAdapter.dll')
    },
    name = 'Attach to Unity'
  }

  dap.configurations.cs = {
    {
      type = 'vstuc',
      request = 'attach',
      name = 'Attach to Unity',
      logFile = vim.fs.joinpath(vim.fn.stdpath('data'), '/vstuc.log'),
      projectPath = function()
        local root = require('uniutil.utils').find_unity_project_root()
        vim.notify("Using Unity Project Root: " .. root, vim.log.levels.INFO)
        return root
      end,
      endPoint = function()
        local system_obj = vim.system(
          { 'dotnet', vim.fs.joinpath(vstuc_path, 'UnityAttachProbe.dll') },
          { text = true })
        local probe_result = system_obj:wait(2000).stdout
        if probe_result == nil or #probe_result == 0 then
          vim.notify("No Endpoint Found (Is Unity Running?)", vim.log.levels.ERROR)
          return ''
        end
        vim.print(probe_result)
        for json in vim.gsplit(probe_result, '\n') do
          if json ~= '' then
            local probe = vim.json.decode(json)
            for _, p in pairs(probe) do
              if p.isBackground == false then
                return p.address .. ':' .. p.debuggerPort
              end
            end
          end
        end
        return ''
      end
    }
  }
end

return M
