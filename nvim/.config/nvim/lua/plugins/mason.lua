require("mason").setup()
local mason_registry = require("mason-registry")

local tools = {
  { name = "clangd" },
  { name = "pyright" },
  { name = "gopls" },
  { name = "shellcheck" },
  { name = "jdtls" },
  { name = "zls", version = "0.15.1" },
  { name = "ruff" },
  { name = "luacheck" },
}

for _, tool in ipairs(tools) do
  local pkg = mason_registry.get_package(tool.name)
  if not pkg:is_installed() then
    pkg:install({
      version = tool.version
    })
  end
end
