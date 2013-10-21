fs = require 'fs'

memory       = []
subrNames    = {}
register     = {}
instructions = {}

GLOBAL.bDebug = true
GLOBAL.lg     = (args...) -> console.log args...
GLOBAL.dbg    = (args...) -> console.log args... if bDebug

module.exports.getRegister = -> register


module.exports.loadInstructions = ->
    dirs = ['./instructions']
    while dirs.length
      dir = dirs.shift()
      for cmdFile in fs.readdirSync dir
        stat = fs.statSync "#{dir}/#{cmdFile}"
        if stat.isDirectory()
          dirs.push "#{dir}/#{cmdFile}"
        else if stat.isFile() and -1 < cmdFile.search /.js$/
          instructions[cmdFile.split('.')[0]] = require "#{dir}/#{cmdFile}"
    console.dir instructions
#    process.exit()


module.exports.resetRegister = ->
  register = ip:0, stack:[]


module.exports.executeInstruction = (instr, args) ->
  instructions[instr] args, register


module.exports.jumpTo = (line) ->
  if subrNames[line]?
    register.ip = subrNames[line]
  else
    console.error "cant jump"

      
module.exports.callSubr = (line) ->
  register.stack.push register.ip
  console.log "dbg:callSubr:IP of #{line} is #{subrNames[line]}" if bDebug
  register.ip = subrNames[line]


module.exports.loadProgramm = (file) ->
  progIn   = fs.readFileSync('./prog.mannicode').toString().split '\n'

  for line in progIn
    flg = ''
    if 0 isnt line.search(/^;/) and 0 isnt line.trim().length # its not a comment or empty line
      if 0 is line.search(/^[a-zA-Z0-9_]+:$/)                 # its a sub routine
        flg = 'subrN'
        subrNames[line.slice 0, -1] = memory.length           # save subrName without :
      else
        flg = 'instr'
      memory.push {ip: memory.length, code:line, type:flg}
#  console.dir memory
#  console.dir subrNames


module.exports.start = ->
  tStart = new Date().getTime()
  while true
    try
      break if not memory[register.ip]?
      instruction = memory[register.ip].code
      if memory[register.ip].type is 'subrN'
        console.log "break on type is subrN #{memory[register.ip].code}" if bDebug
        break
      h       = instruction.trim().split(' ')
      command = h.shift().toLowerCase()
      args = h.join(' ').trim()
    catch e
      if bDebug
        console.dir e
        console.log "IP:#{register.ip}"
      break
    
    try
      @executeInstruction command, args
    catch e
      console.log "ERROR"
      console.log "IP:#{register.ip}"
      console.log "INSTRUCTION:#{instruction}"
      console.dir  e
      console.log "stackTrace"
      console.log l for l in e.stack.split '\n'
    
    "idle" while new Date().getTime() - tStart < 0
    tStart = new Date().getTime()

    register.ip++
  
  console.log "done. Register:"
  console.dir  register
