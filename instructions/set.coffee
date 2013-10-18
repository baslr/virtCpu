
# command:   set
# arguments: register, value 


module.exports = (args, register) ->
  value = args.split(',')
  reg   = value.shift().trim()
  register[reg] = value.join(',').trim()
