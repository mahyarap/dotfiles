require("mason").setup()
local mason_registry = require("mason-registry")

local tools = {
  "clangd",
  "pyright",
  "gopls",
  "shellcheck",
  "jdtls",
  "zls",
  "ruff",
  "luacheck",
}

for _, tool in ipairs(tools) do
  local package = mason_registry.get_package(tool)
  if not package:is_installed() then
    package:install()
  end
end
