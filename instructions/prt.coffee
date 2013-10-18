
# instruction: prt
# arguments: register:r
# arguments: value:r

module.exports = (args, register) ->  
  if 0 is args.search(/^'/)
    lg "prt: #{args.slice 1,-1}"
  else
    lg "prt: #{args}: #{register[args]}"
