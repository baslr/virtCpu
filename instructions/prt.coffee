
# command:   prt
# arguments: prt, register

module.exports = (args, register) ->  
  if 0 is args.search(/^'/)
    console.log "prt: #{args.slice 1,-1}"
  else
    console.log "prt: #{args}: #{register[args]}"
  
