# Remove the reference from the "timer" list
scoreboard players remove #ForceloadLib.TimerChunks ForceloadLib 1
$data remove storage forceloadlib:zprivate TimerChunks[{ID:$(ID)}]
execute if score #ForceloadLib.TimerChunks ForceloadLib matches 0 run return run schedule clear forceloadlib:zprivate/remove/timer_chunks/check_scheduled

# Set "NextRemovalTimestamp"
execute if score #ForceloadLib.TimerChunks ForceloadLib matches 1 run return run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.Duration ForceloadLib
execute if score #ForceloadLib.TimerChunks ForceloadLib matches 2 run return run execute if score #ForceloadLib.NextRemovalTimestamp ForceloadLib > #ForceloadLib.Duration ForceloadLib run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.Duration ForceloadLib

scoreboard players operation #ForceloadLib.ListSize ForceloadLib = #ForceloadLib.TimerChunks ForceloadLib
data modify storage forceloadlib:temporary TimerChunks set from storage forceloadlib:zprivate TimerChunks
execute store result score #ForceloadLib.NextRemovalTimestamp ForceloadLib run data get storage forceloadlib:temporary TimerChunks[-1].RemovalTimestamp
data remove storage forceloadlib:temporary TimerChunks[-1]
function forceloadlib:zprivate/add/set_next_removal_timestamp
data remove storage forceloadlib:temporary TimerChunks
