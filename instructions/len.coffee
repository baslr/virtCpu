
# instruction: len
# arguments:   register:r, register:w

module.exports = (args, register) ->
  args = args.split ','
  
  reg1 = args[0].trim()
  reg2 = args[1].trim()
  
  register[reg2] = register[reg1].length
