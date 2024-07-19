# Get the lowest "RemovalTimestamp" value
execute store result score #ForceloadLib.RemovalTimestamp ForceloadLib run data get storage forceloadlib:temporary TimerReferences[-1].RemovalTimestamp
execute if score #ForceloadLib.RemovalTimestamp ForceloadLib < #ForceloadLib.NextRemovalTimestamp ForceloadLib run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.RemovalTimestamp ForceloadLib

# Check next element
execute if score #ForceloadLib.ListSize ForceloadLib matches 1 run return 0
scoreboard players remove #ForceloadLib.ListSize ForceloadLib 1
data remove storage forceloadlib:temporary TimerReferences[-1]
function forceloadlib:zprivate/add/timer_chunks/set_next_removal_timestamp
