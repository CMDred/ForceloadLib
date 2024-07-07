# Chunk is already loaded when trying to add the reference
function forceloadlib:zprivate/add/run_command with storage forceloadlib:temporary AddChunk
data remove storage forceloadlib:temporary AddChunk
return run scoreboard players get #ForceloadLib.ReferenceID ForceloadLib
