
# instruction: inc
# argument:    register:rw


module.exports = (arg, register) ->
  register[arg]++
