# Run the command, remove the reference from the "loading" list and activate the timer
scoreboard players remove #ForceloadLib.LoadingReferences ForceloadLib 1
data modify storage forceloadlib:temporary AddReference.ID set from storage forceloadlib:temporary LoadingReferences[-1].ID

execute if data storage forceloadlib:temporary LoadingReferences[-1].Duration run data modify storage forceloadlib:temporary AddChunk set from storage forceloadlib:temporary LoadingReferences[-1]
execute if data storage forceloadlib:temporary LoadingReferences[-1].Duration run function forceloadlib:zprivate/add/timer_chunks/set_removal_timestamp
data remove storage forceloadlib:temporary AddChunk

execute store success score #ForceloadLib.HasCommand ForceloadLib run data modify storage forceloadlib:temporary CommandData.Command set from storage forceloadlib:temporary LoadingReferences[-1].Command
execute if score #ForceloadLib.HasCommand ForceloadLib matches 1 run data modify storage forceloadlib:temporary CommandData.Dimension set from storage forceloadlib:temporary LoadingReferences[-1].Dimension
execute if score #ForceloadLib.HasCommand ForceloadLib matches 1 run data modify storage forceloadlib:temporary CommandData.X set from storage forceloadlib:temporary LoadingReferences[-1].Pos[0]
execute if score #ForceloadLib.HasCommand ForceloadLib matches 1 run data modify storage forceloadlib:temporary CommandData.Y set from storage forceloadlib:temporary LoadingReferences[-1].Pos[1]
execute if score #ForceloadLib.HasCommand ForceloadLib matches 1 run data modify storage forceloadlib:temporary CommandData.Z set from storage forceloadlib:temporary LoadingReferences[-1].Pos[2]
execute if score #ForceloadLib.HasCommand ForceloadLib matches 1 run function forceloadlib:zprivate/add/loading_chunks/run_command with storage forceloadlib:temporary CommandData

function forceloadlib:zprivate/add/loading_chunks/remove_loading_tag with storage forceloadlib:temporary LoadingReferences[-1]
data remove storage forceloadlib:temporary AddReference

# Check the next chunk if there is one
execute if score #ForceloadLib.LoadingReferences ForceloadLib matches 0 run return 0
execute unless data storage forceloadlib:temporary LoadingReferences[1] run return 0
data remove storage forceloadlib:temporary LoadingReferences[-1]
function forceloadlib:zprivate/add/loading_chunks/check with storage forceloadlib:temporary LoadingReferences[-1]
