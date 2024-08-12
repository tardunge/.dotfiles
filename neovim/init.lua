-------------------------------------------------|-----------------------------
--                                               |
--                                               |  Manoj Babu Katragadda
--   / /_____ __________/ /_  ______  ____ ____  |  - (tardunge)
--  / __/ __ `/ ___/ __  / / / / __ \/ __ `/ _ \ |
-- / /_/ /_/ / /  / /_/ / /_/ / / / / /_/ /  __/ |  https://github.com/tardunge
-- \__/\__,_/_/   \__,_/\__,_/_/ /_/\__, /\___/  |
--                                 /____/        |
--                                               |
--                                               |
-------------------------------------------------------------------------------

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.g.win_zoom = 1
  
-- Vanilla Config
require('tardunge.settings')
require('tardunge.plugins')
require('tardunge.plugin-setup')
require('tardunge.mappings')
require('tardunge.cmp')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
