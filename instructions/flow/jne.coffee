
# instruction: jne
# argument:    subroutine 


virtCpu = require '../../virtCpu'

module.exports = (arg, register) ->
  if register.ZF is 0
    dbg "dbg:jne:#{arg}"
    virtCpu.jumpTo arg
  else
    register.ip++