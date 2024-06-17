# Check if any 'timer' chunks are ready to be removed
execute store result score #ForceloadLib.Gametime ForceloadLib run time query gametime
execute if score #ForceloadLib.Gametime ForceloadLib < #ForceloadLib.NextRemovalTimestamp ForceloadLib run return run schedule function forceloadlib:zprivate/remove/timer_chunks/check_scheduled 1t

# Remove all due 'timer' chunks & update the NextRemovalTimestamp
scoreboard players operation #ForceloadLib.ListSize ForceloadLib = #ForceloadLib.TimerChunks ForceloadLib
scoreboard players set #ForceloadLib.NextRemovalTimestamp ForceloadLib 2147483647
data modify storage forceloadlib:temporary TimerChunks set from storage forceloadlib:zprivate TimerChunks
data remove storage forceloadlib:zprivate TimerChunks
function forceloadlib:zprivate/remove/timer_chunks/check with storage forceloadlib:temporary TimerChunks[-1]
data remove storage forceloadlib:temporary TimerChunks

# Restart loop
execute if score #ForceloadLib.TimerChunks ForceloadLib matches 1.. run schedule function forceloadlib:zprivate/remove/timer_chunks/check_scheduled 1t
