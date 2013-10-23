
# instruction: prtstack


module.exports = (args, register) ->
  lg "Stack:"
  i = 65535 
  while i >= register.sp
    console.log "#{i}:#{register.stack[i--]}"



