
# insruction: push
# arguments:  register:r

# not implemented yet
# arguments:  value:r


module.exports = (arg, register) ->
  register.stack.push register[arg]
  dbg "push:#{arg}"
