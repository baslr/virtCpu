
# command:   ret

module.exports = (arg, register) ->
  register.ip = register.stack.pop()
  console.log "dbg:ret:IP:#{register.ip}"
