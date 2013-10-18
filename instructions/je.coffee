
# instruction: je
# arguments:   subroutine 


virtCpu = require '../virtCpu'

module.exports = (arg, register) ->
  if register.ZF is 1
    dbg "dbg:je:#{arg}"
    virtCpu.jumpTo arg
