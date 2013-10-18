
# command:   mov
# arguments: register, value 


module.exports = (args, register) ->
  value = args.split(',')
  reg   = value.shift().trim()
  value = value.join(',').trim()
  
  if -1 is value.search(/^'/)
    register[reg] = Number value
  else
    register[reg] = value.slice 1,-1
