local colors = {
  bg = "#1D1D21",
  fg = "#d8d0be",
  dark_bg = "#161c22",
  lighter_bg = "#252529",
  cursor = "#b49c83",
  comment = "#65676a",
  selection = "#4a5261",
  selection_fg = "#e9e4d8",
  line_numbers = "#65676a",
  border = "#3c3c3c",

  -- Primary palette
  brown = "#b49c83", -- More muted brown
  green = "#8ba183", -- Softer sage green
  beige = "#cec2a7", -- Softer beige
  blue = "#8aa2b0", -- Muted blue-gray
  taupe = "#b5a795", -- Softer taupe
  teal = "#8aa7a2", -- Muted teal
  text = "#d8d0be", -- Soft ivory

  -- Bright variants
  bright_brown = "#c5b095", -- Pastel brown
  bright_green = "#9db495", -- Pastel sage
  bright_beige = "#ded5bc", -- Pastel beige
  bright_blue = "#9bb5c4", -- Pastel blue
  bright_taupe = "#c7bbaa", -- Pastel taupe
  bright_teal = "#a1bdb8", -- Pastel teal
  bright_text = "#e9e4d8", -- Soft white

  -- Common programming colors
  red = "#c29f97", -- Muted red
  yellow = "#cfc19f", -- Muted yellow
  orange = "#c6ac90", -- Muted orange
  purple = "#a8a0b4", -- Muted purple
  cyan = "#9cbab5", -- Muted cyan
  pink = "#bfa8b2", -- Muted pink
  diff_add = "#596b59", -- Subtle green
  diff_change = "#6b6955", -- Subtle yellow
  diff_delete = "#6b5757", -- Subtle red
  diff_text = "#5e6b79", -- Subtle blue
}

local highlight_groups = {
  -- Editor UI
  Normal = { fg = colors.fg, bg = "NONE" }, -- Transparent background
  NormalFloat = { fg = colors.fg, bg = "NONE" },
  FloatBorder = { fg = colors.border, bg = "NONE" },
  Cursor = { fg = colors.bg, bg = colors.cursor },
  CursorLine = { bg = colors.lighter_bg },
  CursorLineNr = { fg = colors.bright_text, bold = true },
  LineNr = { fg = colors.line_numbers },
  SignColumn = { fg = colors.line_numbers, bg = "NONE" },
  Pmenu = { fg = colors.fg, bg = "NONE" },
  PmenuSel = { fg = colors.bright_text, bg = colors.selection },
  PmenuSbar = { bg = "NONE" },
  PmenuThumb = { bg = colors.comment },
  MatchParen = { fg = colors.bright_text, bg = colors.selection, bold = true },
  StatusLine = { fg = colors.fg, bg = "NONE" },
  StatusLineNC = { fg = colors.comment, bg = "NONE" },
  VertSplit = { fg = colors.border, bg = "NONE" },
  WinSeparator = { fg = colors.border, bg = "NONE" },
  Visual = { bg = colors.selection, fg = colors.selection_fg },
  Search = { fg = colors.bright_text, bg = colors.blue },
  IncSearch = { fg = colors.dark_bg, bg = colors.yellow },
  Folded = { fg = colors.comment, bg = "NONE", italic = true },
  FoldColumn = { fg = colors.line_numbers, bg = "NONE" },
  NonText = { fg = colors.comment },
  SpecialKey = { fg = colors.comment },
  Directory = { fg = colors.blue },
  Title = { fg = colors.bright_green, bold = true },
  ErrorMsg = { fg = colors.red, bold = true },
  WarningMsg = { fg = colors.yellow, bold = true },
  MoreMsg = { fg = colors.green },
  Question = { fg = colors.blue },
  WildMenu = { fg = colors.bright_text, bg = colors.selection },

  -- Syntax Highlighting
  Comment = { fg = colors.comment, italic = true },
  Constant = { fg = colors.taupe },
  String = { fg = colors.green },
  Character = { fg = colors.green },
  Number = { fg = colors.orange },
  Boolean = { fg = colors.orange },
  Float = { fg = colors.orange },
  Identifier = { fg = colors.blue },
  Function = { fg = colors.bright_blue },
  Statement = { fg = colors.brown },
  Conditional = { fg = colors.brown },
  Repeat = { fg = colors.brown },
  Label = { fg = colors.brown },
  Operator = { fg = colors.bright_brown },
  Keyword = { fg = colors.brown },
  Exception = { fg = colors.red },
  PreProc = { fg = colors.purple },
  Include = { fg = colors.purple },
  Define = { fg = colors.purple },
  Macro = { fg = colors.purple },
  PreCondit = { fg = colors.purple },
  Type = { fg = colors.teal },
  StorageClass = { fg = colors.brown },
  Structure = { fg = colors.teal },
  Typedef = { fg = colors.teal },
  Special = { fg = colors.bright_taupe },
  SpecialChar = { fg = colors.bright_taupe },
  Tag = { fg = colors.bright_green },
  Delimiter = { fg = colors.fg },
  SpecialComment = { fg = colors.comment, italic = true, bold = true },
  Debug = { fg = colors.red },
  Underlined = { fg = colors.blue, underline = true },
  Error = { fg = colors.red, underline = true },
  Todo = { fg = colors.bg, bg = colors.yellow, bold = true },

  -- Diff
  DiffAdd = { bg = colors.diff_add },
  DiffChange = { bg = colors.diff_change },
  DiffDelete = { bg = colors.diff_delete },
  DiffText = { bg = colors.diff_text },

  -- Git
  GitGutterAdd = { fg = colors.bright_green },
  GitGutterChange = { fg = colors.bright_blue },
  GitGutterDelete = { fg = colors.red },

  -- Spelling
  SpellBad = { undercurl = true, sp = colors.red },
  SpellCap = { undercurl = true, sp = colors.yellow },
  SpellRare = { undercurl = true, sp = colors.purple },
  SpellLocal = { undercurl = true, sp = colors.teal },

  -- Treesitter
  ["@variable"] = { fg = colors.fg },
  ["@field"] = { fg = colors.fg },
  ["@property"] = { fg = colors.beige },
  ["@parameter"] = { fg = colors.beige, italic = true },
  ["@function"] = { fg = colors.bright_blue },
  ["@function.builtin"] = { fg = colors.blue },
  ["@function.macro"] = { fg = colors.purple },
  ["@method"] = { fg = colors.bright_blue },
  ["@constructor"] = { fg = colors.teal },
  ["@constant"] = { fg = colors.taupe },
  ["@conditional"] = { fg = colors.brown },
  ["@repeat"] = { fg = colors.brown },
  ["@exception"] = { fg = colors.red },
  ["@keyword"] = { fg = colors.brown },
  ["@keyword.function"] = { fg = colors.brown },
  ["@keyword.operator"] = { fg = colors.brown },
  ["@operator"] = { fg = colors.bright_brown },
  ["@type"] = { fg = colors.teal },
  ["@type.builtin"] = { fg = colors.teal, italic = true },
  ["@namespace"] = { fg = colors.taupe },
  ["@include"] = { fg = colors.purple },
  ["@string"] = { fg = colors.green },
  ["@string.escape"] = { fg = colors.bright_taupe },
  ["@number"] = { fg = colors.orange },
  ["@boolean"] = { fg = colors.orange },
  ["@comment"] = { fg = colors.comment, italic = true },
  ["@punctuation.delimiter"] = { fg = colors.fg },
  ["@punctuation.bracket"] = { fg = colors.fg },
  ["@punctuation.special"] = { fg = colors.bright_taupe },
  ["@tag"] = { fg = colors.brown },
  ["@tag.attribute"] = { fg = colors.teal },
  ["@tag.delimiter"] = { fg = colors.fg },

  -- LSP
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInfo = { fg = colors.blue },
  DiagnosticHint = { fg = colors.teal },
  DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
  DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
  DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
  DiagnosticUnderlineHint = { undercurl = true, sp = colors.teal },
  LspReferenceText = { bg = colors.selection },
  LspReferenceRead = { bg = colors.selection },
  LspReferenceWrite = { bg = colors.selection },
}

-- Apply the highlights
local function apply_highlights()
  -- Clear existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Set color scheme name
  vim.g.colors_name = "misty-landscape"

  -- Set terminal colors
  vim.g.terminal_color_0 = colors.dark_bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.teal
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.comment
  vim.g.terminal_color_9 = colors.bright_brown
  vim.g.terminal_color_10 = colors.bright_green
  vim.g.terminal_color_11 = colors.bright_beige
  vim.g.terminal_color_12 = colors.bright_blue
  vim.g.terminal_color_13 = colors.pink
  vim.g.terminal_color_14 = colors.bright_teal
  vim.g.terminal_color_15 = colors.bright_text

  -- Apply highlight groups
  for group, styles in pairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group, styles)
  end
end

apply_highlights()

return {
  colors = colors,
  highlights = highlight_groups,
}
