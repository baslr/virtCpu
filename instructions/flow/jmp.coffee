
# instruction: jmp
# arguments:   subroutine 


virtCpu = require '../../virtCpu'

module.exports = (arg, register) ->
    virtCpu.jumpTo arg
