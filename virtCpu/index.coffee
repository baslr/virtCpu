fs           = require 'fs'
memory       = []
subrNames    = {}
register     = {}
instructions = {}

GLOBAL.lg     = (args...) -> console.log args...
GLOBAL.dbg    = (args...) -> console.log args... if bDebug

module.exports.getRegister = -> register


module.exports.loadInstructions = ->
  dirs = ["#{process.cwd()}/instructions"]
  while dirs.length
    dir = dirs.shift()
    for cmdFile in fs.readdirSync dir
      stat = fs.statSync "#{dir}/#{cmdFile}"
      if stat.isDirectory()
        dirs.push "#{dir}/#{cmdFile}"
      else if stat.isFile() and -1 < cmdFile.search /.js$/
        instructions[cmdFile.split('.')[0]] = require "#{dir}/#{cmdFile}"

  console.dir instructions if bDebug


module.exports.resetRegister = ->
  register = ip:0, sp:Math.pow(2,16)-1, stack:{} # (for [0..Math.pow 2,16] then undefined)


module.exports.executeInstruction = (instr, args) ->
  instructions[instr] args, register


module.exports.jumpTo = (line) ->
  if subrNames[line]?
    register.ip = subrNames[line]
  else
    console.error "cant jump"

      
module.exports.callSubr = (line) ->
  register.stack[register.sp--] = register.ip
  console.log "dbg:callSubr:IP of #{line} is #{subrNames[line]}" if bDebug
  register.ip = subrNames[line]


module.exports.loadProgramm = (file) ->
  progIn   = fs.readFileSync(file).toString().split '\n'

  for line in progIn
    flg = ''
    if 0 isnt line.search(/^;/) and 0 isnt line.trim().length # its not a comment or empty line
      if 0 is line.search(/^\.{0,1}[a-zA-Z0-9_]+:$/)                 # its a sub routine
        flg = 'subrN'
        subrNames[line.slice 0, -1] = memory.length           # save subrName without :
        continue
      else
        flg = 'instr'
      memory.push {ip: memory.length, code:line, type:flg}
  if bDebug
    console.dir memory
    console.dir subrNames

module.exports.start = (delay) ->
  tStart = new Date().getTime()
  while true
    compTime = new Date().getTime()
    try
      break    if not memory[register.ip]?
      if memory[register.ip].type is 'subrN'
        register.ip++
        continue

      instruction = memory[register.ip].code
      
      dbg "INSTRUCTION:#{instruction}"
      h       = instruction.trim().split(' ')
      command = h.shift().toLowerCase()
      args = h.join(' ').trim()
    catch e
      if bDebug
        console.dir  e
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
    
    compTime = new Date().getTime() - compTime
    "idle" while new Date().getTime() - tStart + compTime < delay
    tStart = new Date().getTime()
      
    register.ip++ if -1 is command.search(/^(call|jmp|jne|je)$/)
  
  console.log "done. Register:"
  console.dir  register
