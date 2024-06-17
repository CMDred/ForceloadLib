# Get the lowest "RemovalTimestamp" value
execute store result score #ForceloadLib.PotentialNextRemovalTimestamp ForceloadLib run data get storage forceloadlib:temporary TimerChunks[-1].RemovalTimestamp
execute if score #ForceloadLib.PotentialNextRemovalTimestamp ForceloadLib < #ForceloadLib.NextRemovalTimestamp ForceloadLib run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.PotentialNextRemovalTimestamp ForceloadLib

# Check next element
execute if score #ForceloadLib.ListSize ForceloadLib matches 1 run return 0
scoreboard players remove #ForceloadLib.ListSize ForceloadLib 1
data remove storage forceloadlib:temporary TimerChunks[-1]
function forceloadlib:zprivate/add/timer_chunks/set_next_removal_timestamp
