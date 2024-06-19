data remove storage forceloadlib:temporary AddChunk.Command

# Set the timestamp at which the reference gets removed automatically
execute store result score #ForceloadLib.Gametime ForceloadLib run time query gametime
execute store result score #ForceloadLib.Duration ForceloadLib run data get storage forceloadlib:temporary AddChunk.Duration
execute store result storage forceloadlib:temporary AddChunk.RemovalTimestamp int 1 store result storage forceloadlib:temporary AddReference.RemovalTimestamp int 1 run scoreboard players operation #ForceloadLib.Duration ForceloadLib += #ForceloadLib.Gametime ForceloadLib

# Add reference to "timer" list
data remove storage forceloadlib:temporary AddChunk.Duration
data modify storage forceloadlib:zprivate TimerReferences append from storage forceloadlib:temporary AddChunk
scoreboard players add #ForceloadLib.TimerReferences ForceloadLib 1
schedule function forceloadlib:zprivate/remove/timer_chunks/check_scheduled 1t

# Set "NextRemovalTimestamp"
execute if score #ForceloadLib.TimerReferences ForceloadLib matches 1 run return run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.Duration ForceloadLib
execute if score #ForceloadLib.TimerReferences ForceloadLib matches 2 run return run execute if score #ForceloadLib.NextRemovalTimestamp ForceloadLib > #ForceloadLib.Duration ForceloadLib run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.Duration ForceloadLib

scoreboard players operation #ForceloadLib.ListSize ForceloadLib = #ForceloadLib.TimerReferences ForceloadLib
data modify storage forceloadlib:temporary TimerReferences set from storage forceloadlib:zprivate TimerReferences
execute store result score #ForceloadLib.NextRemovalTimestamp ForceloadLib run data get storage forceloadlib:temporary TimerReferences[-1].RemovalTimestamp
data remove storage forceloadlib:temporary TimerReferences[-1]
function forceloadlib:zprivate/add/set_next_removal_timestamp
data remove storage forceloadlib:temporary TimerReferences
