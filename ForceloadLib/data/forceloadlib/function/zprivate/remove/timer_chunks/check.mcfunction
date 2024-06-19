# Check if this reference's deletion is due
execute store result score #ForceloadLib.RemovalTimestamp ForceloadLib run data get storage forceloadlib:temporary TimerReferences[-1].RemovalTimestamp
execute if score #ForceloadLib.RemovalTimestamp ForceloadLib <= #ForceloadLib.Gametime ForceloadLib run scoreboard players remove #ForceloadLib.TimerReferences ForceloadLib 1
execute if score #ForceloadLib.RemovalTimestamp ForceloadLib <= #ForceloadLib.Gametime ForceloadLib run function forceloadlib:zprivate/remove/timer_chunks/remove_from_chunk with storage forceloadlib:temporary TimerReferences[-1]

# Update the "NextRemovalTimestamp" & Add element back to the list
execute unless score #ForceloadLib.RemovalTimestamp ForceloadLib <= #ForceloadLib.Gametime ForceloadLib if score #ForceloadLib.RemovalTimestamp ForceloadLib < #ForceloadLib.NextRemovalTimestamp ForceloadLib run data modify storage forceloadlib:zprivate TimerReferences append from storage forceloadlib:temporary TimerReferences[-1]
execute unless score #ForceloadLib.RemovalTimestamp ForceloadLib <= #ForceloadLib.Gametime ForceloadLib if score #ForceloadLib.RemovalTimestamp ForceloadLib < #ForceloadLib.NextRemovalTimestamp ForceloadLib run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.RemovalTimestamp ForceloadLib

# Check next element
execute if score #ForceloadLib.ListSize ForceloadLib matches 1 run return 0
scoreboard players remove #ForceloadLib.ListSize ForceloadLib 1
data remove storage forceloadlib:temporary TimerReferences[-1]
function forceloadlib:zprivate/remove/timer_chunks/check
