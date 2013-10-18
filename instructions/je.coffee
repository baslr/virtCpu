
virtCpu = require '../virtCpu'

# command:   je
# arguments: target 

module.exports = (arg, register) ->
  if register.ZF is 1
    console.log "jump to #{arg}" if bDebug
    virtCpu.jumpTo arg