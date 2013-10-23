
# insruction: mov
# arguments:  register:w, Number:r
# arguments:  register:w, 'String':r
# arguments:  register:w, register:r


module.exports = (args, register) ->
  value = args.split(',')
  reg   = value.shift().trim()
  value = value.join(',').trim()
  
  if      0 is value.search(/(\-|\+)?(\d+\.\d+|\d+\.|\.\d+|\d+)/)
    register[reg] = Number value
  else if 0  is value.search(/^'/)
    register[reg] = value.slice 1,-1
  else if 2 is value.length and
          0 is value.search(/^[a-z]{2,2}$/)
    register[reg] = register[value]
