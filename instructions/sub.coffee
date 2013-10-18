
# command:   sub
# arguments: register, register, target 
# arguments: register, value


# not implemented
# arguments: register, value,    target


module.exports = (args, register) ->
  args = args.split ', '
  
  if      3 is args.length
    reg1 = args[0].trim()
    reg2 = args[1].trim()
    targ = args[2].trim()
    
    register[targ] = register[reg1] - register[reg2]

  else if 2 is args.length
    reg = args[0].trim()
    val = args[1].trim()
    
    register[reg] = register[reg] - val
