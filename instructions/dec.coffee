
# instruction: dec
# argument:    register:rw


module.exports = (arg, register) ->
  register[arg]--
