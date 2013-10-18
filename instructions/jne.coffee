
virtCpu = require '../virtCpu'

# command:   jne
# arguments: target 

module.exports = (arg, register) ->
  if register.ZF is 0
    console.log "jump to #{arg}" if bDebug
    virtCpu.jumpTo arg
