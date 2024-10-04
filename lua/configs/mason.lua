local function install_mason_packages(packages)
  local mason_ok, mason = pcall(require, "mason")
  if not mason_ok then
    print "Mason is not installed. Please install mason.nvim first."
    return
  end

  local registry_ok, registry = pcall(require, "mason-registry")
  if not registry_ok then
    print "Mason registry is not available. There might be an issue with your Mason installation."
    return
  end

  local function install_package(package_name)
    if not registry.is_installed(package_name) then
      vim.cmd("MasonInstall " .. package_name)
      print("Installed " .. package_name)
    else
      print(package_name .. " is already installed")
    end
  end

  for _, package in ipairs(packages) do
    install_package(package)
  end
end

local requested_packages = {
  "bash-language-server",
  "buf",
  "clangd",
  "docker-compose-language-service",
  "dockerfile-language-server",
  "doctoc",
  "flake8",
  "gopls",
  "gofumpt",
  "google-java-format",
  "graphql-language-service-cli",
  "harper-ls",
  "html-lsp",
  "jdtls",
  "json-lsp",
  "lua-language-server",
  "prettier",
  "pyright",
  "pylama",
  "shellcheck",
  "shfmt",
  "terraform-ls",
  "tflint",
  "stylua",
  "sqlls",
  "typescript-language-server",
  "yaml-language-server",
}

require("mason").setup {}
install_mason_packages(requested_packages)
