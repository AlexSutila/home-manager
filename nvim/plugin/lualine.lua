local ok, palette = pcall(function()
  package.path = package.path .. ";" .. vim.fn.expand("~/.theme/?.lua")
  return require("palette")
end)

if not ok then
  vim.notify("Failed to load ~/.theme/palette.lua", vim.log.levels.ERROR)
  return
end

-- Define custom theme
local theme = {
  normal = {
    a = { fg = palette.base00, bg = palette.base0C },
    b = { fg = palette.base0C, bg = palette.base02 },
    c = { fg = palette.base0C, bg = palette.base03 },
    z = { fg = palette.base00, bg = palette.base0C },
  },
  insert  = { a = { fg = palette.base00, bg = palette.base0A } },
  visual  = { a = { fg = palette.base00, bg = palette.base0A } },
  replace = { a = { fg = palette.base00, bg = palette.base0A } },
}

-- Harpoon + buffers in one component
local function harpoon_component()
  local ok, harpoon = pcall(require, "harpoon")
  if not ok then return "" end

  local keys = { "F", "D", "S", "A" }
  local display = {}
  for i, item in ipairs(harpoon:list().items) do
    local label = keys[i] or tostring(i)  -- fallback if > 4 entries
    local filename = vim.fn.fnamemodify(item.value, ":t")
    table.insert(display, string.format(" %s) %s ", label, filename))
  end
  return table.concat(display, "|")
end

-- Lualine config
require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    theme = theme,
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      harpoon_component,
      {
        'buffers',
        buffers_color = {
          active = { fg = palette.base00, bg = palette.base0C },
          inactive = { fg = palette.base03, bg = palette.base01 },
        },
      },
    },
    lualine_x = {
      'diff',
      {
        'diagnostics',
        sources = { 'nvim_diagnostic', 'coc' },
        sections = { 'error', 'warn', 'info' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          error = { fg = '#ec5f67' },
          warn = { fg = '#ECBE7B' },
          info = { fg = '#008080' },
        },
        always_visible = true,
      },
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
