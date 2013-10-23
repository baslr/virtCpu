
# insruction: push
# arguments:  register:r

# not implemented yet
# arguments:  value:r


module.exports = (arg, register) ->
  register.stack[register.sp--] = register[arg]
  dbg "push:#{arg}"
