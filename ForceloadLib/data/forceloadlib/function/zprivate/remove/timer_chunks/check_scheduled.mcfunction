# Check if any 'timer' chunks are ready to be removed
execute store result score #ForceloadLib.Gametime ForceloadLib run time query gametime
execute if score #ForceloadLib.Gametime ForceloadLib < #ForceloadLib.NextRemovalTimestamp ForceloadLib run return run schedule function forceloadlib:zprivate/remove/timer_chunks/check_scheduled 1t

# Remove all due 'timer' chunks & update the NextRemovalTimestamp
scoreboard players operation #ForceloadLib.ListSize ForceloadLib = #ForceloadLib.TimerReferences ForceloadLib
scoreboard players set #ForceloadLib.NextRemovalTimestamp ForceloadLib 2147483647
data modify storage forceloadlib:temporary TimerReferences set from storage forceloadlib:zprivate TimerReferences
data remove storage forceloadlib:zprivate TimerReferences
function forceloadlib:zprivate/remove/timer_chunks/check with storage forceloadlib:temporary TimerReferences[-1]
data remove storage forceloadlib:temporary TimerReferences

# Restart loop
execute if score #ForceloadLib.TimerReferences ForceloadLib matches 1.. run schedule function forceloadlib:zprivate/remove/timer_chunks/check_scheduled 1t
