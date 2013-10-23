
# instruction: ret


module.exports = (arg, register) ->
  console.dir register.sp
  register.ip = register.stack[++register.sp] # pop()
  console.dir "ip:#{register.ip}"
  dbg "dbg:ret:IP:#{register.ip}"
