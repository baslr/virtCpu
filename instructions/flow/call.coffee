
# instruction: call
# argument:    subroutine


virtCpu = require '../../virtCpu'

module.exports = (arg, register) ->
  dbg "dbg:call:#{arg}"
  virtCpu.callSubr arg
