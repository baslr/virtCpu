
# insruction: pop
# arguments:  register:w


module.exports = (arg, register) ->
  register[arg] = register.stack.pop()
  dbg "pop:#{arg}"
