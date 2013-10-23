argv     = require('optimist').default('d', false).alias('d', 'debug').boolean('debug').default('file','main.mannicode').alias('f', 'file').default('ms',500).argv
virtCpu  = require './virtCpu'

GLOBAL.bDebug = argv.debug

virtCpu.loadInstructions()
virtCpu.resetRegister()

register = virtCpu.getRegister()

virtCpu.loadProgramm argv.file

virtCpu.start(argv.ms)

console.log "end"


###

--file
-f
--debug
-d
--ms

###