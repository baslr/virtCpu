
# instruction: mul
# arguments:   register:r, register:r, register:w
# arguments:   register:rw, value:r


# not implemented
# arguments: register, value,    target


module.exports = (args, register) ->
  args = args.split ', '
  
  if      3 is args.length
    reg1 = args[0].trim()
    reg2 = args[1].trim()
    targ = args[2].trim()
    
    register[targ] = Number(register[reg1]) * Number(register[reg2])

  else if 2 is args.length
    reg = args[0].trim()
    val = args[1].trim()
    
    register[reg] *= Number val
