local status_ok, km = pcall(require, "key-menu")
if not status_ok then
  return
end

km.set('n', 'g')
km.set('v', 'g')
km.set('n', '<leader>')
km.set('v', '<leader>')

