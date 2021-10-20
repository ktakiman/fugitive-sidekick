local getVisualSelection = function()
  local _, startLine, startCol, _ = unpack(vim.fn.getpos("'<"))
  local _, endLine, endCol, _ = unpack(vim.fn.getpos("'>"))
  print(startLine, startCol, endLine, endCol)
  
  if startLine == endLine then
    local line = vim.api.nvim_buf_get_lines(0, startLine - 1, startLine, true)[1]
    if line == nil then
      print('line is nil')
      print(startLine, startCol, endLine, endCol)
      return
    end
    print('line', line)
    local selected = string.sub(line, startCol, endCol)
    print('selected', selected)
    return selected
  end
end

local listFilesInCommit = function()
  local cmdId = getVisualSelection()
  print('cmdId', cmdId)

  if cmdId == nil then
    print('cmdId is nil')
    return
  end
  -- todo
  --   1. check if cmdId is in a form of commit id
  --   2. check register if cmdId is empty?
  local difftoolCmd = "tabnew | G difftool --name-only " .. cmdId .. "^ " .. cmdId .. " | Gvdiffsplit !^"
  print('difftoolCmd', difftoolCmd)
  vim.cmd(difftoolCmd)
end

local diffNext = function()
  vim.cmd("quit | cnext | Gvdiffsplit !^")
end

local diffPrev = function()
  vim.cmd("quit | cprev | Gvdiffsplit !^")
end

return {
  listFilesInCommit = listFilesInCommit,
  diffNext = diffNext,
  diffPrev = diffPrev
}

