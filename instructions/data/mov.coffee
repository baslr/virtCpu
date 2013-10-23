
# insruction: mov
# arguments:  register:w, value:r
# arguments:  register:w, register:r


module.exports = (args, register) ->
  value = args.split(',')
  reg   = value.shift().trim()
  value = value.join(',').trim()
  
  if value.length is 2 and 0 is value.search(/^[a-z]{2,2}$/)
    register[reg] = register[value]
  else if -1 is value.search(/^'/)
    register[reg] = Number value
  else if 0  is value.search(/^'/)
    register[reg] = value.slice 1,-1
