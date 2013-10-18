
# command:   cmp
# arguments: register, register 

module.exports = (args, register) ->
  args = args.split ','
  
  reg1 = args[0].trim()
  reg2 = args[1].trim()
  
  if register[reg1] is register[reg2]
    register['ZF'] = 1
  else
    register['ZF'] = 0