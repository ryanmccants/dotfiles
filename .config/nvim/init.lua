-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- safely load local overrides if they exist
pcall(require, "config.local")
