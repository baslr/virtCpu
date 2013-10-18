
# command:   call
# arguments: subr

virtCpu = require '../virtCpu'


module.exports = (arg, register) ->
  console.log "dbg:call:#{arg}" if bDebug
  virtCpu.callSubr arg
