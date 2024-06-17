# Set the timestamp at which the reference gets removed automatically
execute store result score #ForceloadLib.Gametime ForceloadLib run time query gametime
execute store result score #ForceloadLib.Duration ForceloadLib run data get storage forceloadlib:temporary AddChunk.Duration
execute store result storage forceloadlib:temporary AddChunk.RemovalTimestamp int 1 run scoreboard players operation #ForceloadLib.Duration ForceloadLib += #ForceloadLib.Gametime ForceloadLib

# Add reference to "timer" list
data remove storage forceloadlib:temporary AddChunk.Duration
data modify storage forceloadlib:zprivate TimerChunks append from storage forceloadlib:temporary AddChunk
data remove storage forceloadlib:temporary AddChunk.RemovalTimestamp
scoreboard players add #ForceloadLib.TimerChunks ForceloadLib 1
schedule function forceloadlib:zprivate/remove/timer_chunks/check_scheduled 1t

# Set "NextRemovalTimestamp"
execute if score #ForceloadLib.TimerChunks ForceloadLib matches 1 run return run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.Duration ForceloadLib
execute if score #ForceloadLib.TimerChunks ForceloadLib matches 2 run return run execute if score #ForceloadLib.NextRemovalTimestamp ForceloadLib > #ForceloadLib.Duration ForceloadLib run scoreboard players operation #ForceloadLib.NextRemovalTimestamp ForceloadLib = #ForceloadLib.Duration ForceloadLib

scoreboard players operation #ForceloadLib.ListSize ForceloadLib = #ForceloadLib.TimerChunks ForceloadLib
function forceloadlib:zprivate/add/timer_chunks/set_removal_timestamp_loop
