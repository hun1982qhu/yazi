local M = {}

function M:preload(job)
  local url = job.file.url
  local stream = fs.calc_size(url)
  if not stream then return true end

  local size = 0
  while true do
    local chunk = stream:recv()
    if not chunk then break end
    size = size + chunk
  end

  ya.emit("update_files", { op = fs.op("size", {
    url = url.trail,
    sizes = { [url.key] = size },
  }) })
  return true
end

return M
