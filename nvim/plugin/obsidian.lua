
local function parse_name_path(input_str)
    local name, path = input_str:match("([^,]+),(.+)")
    if name and path then
        return { name = name, path = path }
    else
        return nil
    end
end

local function get_env_paths(env_var)
    local env_value = os.getenv(env_var)
    if not env_value then
        return {}
    end
    local delimiter = package.config:sub(1, 1) == '/' and ':' or ';'
    local paths = {}
    for path in string.gmatch(env_value, "([^" .. delimiter .. "]+)") do
        table.insert(paths, parse_name_path(path))
    end
    return paths
end

-- My intention is to provide flexibility and allow for mutliple vaults
-- on any given machine without hardcoding paths and names in my config.
-- This VAULTS environment variable can be exported in the .bashrc in a
-- similar manner to how the PATH environment variable works.
local workspaces = get_env_paths('VAULTS')
if #workspaces > 0 then

  require("obsidian").setup({

    workspaces = workspaces,

    mappings = {

      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },

      ["<leader>gf"] = {
        action = function()
          vim.cmd('ObsidianTOC')
        end,
        opts = { noremap = false, buffer = true },
      },

      ["<leader>oo"] = {
        action = function()
          vim.cmd('ObsidianOpen')
        end,
        opts = { noremap = false, buffer = true },
      },

      ["<leader>op"] = {
        action = function()
          vim.cmd('ObsidianPasteImg' .. os.date("%Y-%m-%d-%H-%M-%S"))
        end,
        opts = { noremap = false, buffer = true },
      },

      ["<leader>ol"] = {
        action = function()
          vim.cmd('ObsidianLinks')
        end,
        opts = { noremap = false, buffer = true },
      },

      ["<leader>oL"] = {
        action = function()
          vim.cmd('ObsidianBacklinks')
        end,
        opts = { noremap = false, buffer = true },
      },

    },

    notes_subdir = "Inbox",
    new_notes_location = "notes_subdir",

    note_id_func = function(title)
      local new_title = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        new_title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        return title
      end
      return new_title
    end,

    note_frontmatter_func = function(note)
      local out = {
        id          = note.id       ,
        tags        = note.tags     ,
        hubs        = {}            ,
        urls        = {}            ,
      }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    log_level = vim.log.levels.ERROR,
    wiki_link_func = "use_alias_only",

    daily_notes = {
        folder = "Daily",
        default_tags = {},
    },
  })

end
