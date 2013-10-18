
# instruction: set
# arguments:   register:w, value:r


module.exports = (args, register) ->
  lg 'instruction set is deprecated. Please use move instead.'
  value = args.split(',')
  reg   = value.shift().trim()
  register[reg] = value.join(',').trim()
