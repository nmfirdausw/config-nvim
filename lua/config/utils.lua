local M = {}

M.is_git_dir = function()
  local cwd = vim.fn.getcwd():gsub(" ", "\\ ")
  local gitdir = vim.fn.finddir(".git", cwd .. ";")
  return gitdir ~= ""
end

M.is_laravel_project = function()
  local current_dir = vim.fn.getcwd()
  local function check_laravel_markers(dir)
    local markers = { "artisan", "composer.json", "app/Http/Kernel.php" }
    for _, marker in ipairs(markers) do
      if vim.fn.filereadable(dir .. "/" .. marker) == 1 then
        return true
      end
    end
    return false
  end

  local dir = current_dir
  while dir ~= "/" do
    if check_laravel_markers(dir) then
      return true
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end

  return false
end

return M
