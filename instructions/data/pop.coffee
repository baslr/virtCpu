
# insruction: pop
# arguments:  register:w


module.exports = (arg, register) ->
  register[arg] = register.stack[++register.sp]
  dbg "pop:#{arg}"
