# Check if any 'waiting' chunks are now loaded
execute if score #ForceloadLib.NewChunksLoaded ForceloadLib matches 0 run return run schedule function forceloadlib:zprivate/forceload_remove/check_waiting_scheduled 1t

data modify storage forceloadlib:temporary WaitingChunks set from storage forceloadlib:zprivate WaitingChunks
function forceloadlib:zprivate/forceload_remove/check_waiting with storage forceloadlib:temporary WaitingChunks[-1]
data modify storage forceloadlib:zprivate WaitingChunks set from storage forceloadlib:temporary StillWaitingChunks
data remove storage forceloadlib:temporary WaitingChunks
data remove storage forceloadlib:temporary StillWaitingChunks

# Restart loop
execute if score #ForceloadLib.WaitingChunks ForceloadLib matches 1.. run schedule function forceloadlib:zprivate/forceload_remove/check_waiting_scheduled 1t
