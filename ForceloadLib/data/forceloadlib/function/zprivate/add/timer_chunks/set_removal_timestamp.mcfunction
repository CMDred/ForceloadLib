# Set the timestamp at which the reference gets removed automatically
execute store result score #ForceloadLib.GameTime ForceloadLib run time query gametime
execute store result score #ForceloadLib.Duration ForceloadLib run data get storage forceloadlib:temporary AddChunk.Duration
execute store result storage forceloadlib:temporary AddChunk.RemovalTimestamp int 1 store result storage forceloadlib:temporary AddReference.RemovalTimestamp int 1 run scoreboard players operation #ForceloadLib.Duration ForceloadLib += #ForceloadLib.GameTime ForceloadLib

# Add reference to "timer" list (Removing the 'Command', 'CommandTrigger', 'Pos' and 'Force' data is only done to make the data cleaner, as it's unused inside the TimerReferences data)
data remove storage forceloadlib:temporary AddChunk.Duration
data modify storage forceloadlib:zprivate TimerReferences append from storage forceloadlib:temporary AddChunk
data remove storage forceloadlib:zprivate TimerReferences[-1].Command
data remove storage forceloadlib:zprivate TimerReferences[-1].CommandTrigger
data remove storage forceloadlib:zprivate TimerReferences[-1].Pos
data remove storage forceloadlib:zprivate TimerReferences[-1].Force
scoreboard players add #ForceloadLib.TimerReferences ForceloadLib 1

schedule function forceloadlib:zprivate/remove/timer_chunks/check_scheduled 1t

# Set "NextRemovalTimestamp"
execute if score #ForceloadLib.TimerReferences ForceloadLib matches 1 run return run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.Duration ForceloadLib
execute if score #ForceloadLib.TimerReferences ForceloadLib matches 2 run return run execute if score #ForceloadLib.NextRemovalTimestamp ForceloadLib > #ForceloadLib.Duration ForceloadLib run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.Duration ForceloadLib

scoreboard players operation #ForceloadLib.ListSize ForceloadLib = #ForceloadLib.TimerReferences ForceloadLib
data modify storage forceloadlib:temporary TimerReferences set from storage forceloadlib:zprivate TimerReferences
execute store result score #ForceloadLib.NextRemovalTimestamp ForceloadLib run data get storage forceloadlib:temporary TimerReferences[-1].RemovalTimestamp
scoreboard players remove #ForceloadLib.ListSize ForceloadLib 1
data remove storage forceloadlib:temporary TimerReferences[-1]
function forceloadlib:zprivate/add/timer_chunks/set_next_removal_timestamp
data remove storage forceloadlib:temporary TimerReferences
