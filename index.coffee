
virtCpu  = require './virtCpu'
virtCpu.loadInstructions()
virtCpu.resetRegister()

register = virtCpu.getRegister()

virtCpu.loadProgramm './prog.mannicode'

virtCpu.start()

console.log "end"
