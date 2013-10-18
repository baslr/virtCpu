
virtCpu  = require './virtCpu'
virtCpu.loadInstructions()
virtCpu.initRegister()

register = virtCpu.getRegister()

virtCpu.loadProgramm './prog.mannicode'


virtCpu.start()

console.log "end"
