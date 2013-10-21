
# instruction: ret


module.exports = (arg, register) ->
  register.ip = register.stack.pop()
  dbg "dbg:ret:IP:#{register.ip}"
