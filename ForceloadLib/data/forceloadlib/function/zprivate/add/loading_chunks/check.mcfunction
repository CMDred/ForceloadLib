# Check if the chunk is now loaded
$execute in $(Dimension) store success score #ForceloadLib.IsLoaded ForceloadLib if loaded $(X) 0 $(Z)
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 run data modify storage forceloadlib:zprivate LoadingReferences append from storage forceloadlib:temporary LoadingReferences[-1]
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 run data remove storage forceloadlib:temporary LoadingReferences[-1]
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 run return run execute if data storage forceloadlib:temporary LoadingReferences[1] run function forceloadlib:zprivate/add/loading_chunks/check with storage forceloadlib:temporary LoadingReferences[-1]

# Run the command, remove the reference from the "loading" list and activate the timer
scoreboard players remove #ForceloadLib.LoadingReferences ForceloadLib 1
data modify storage forceloadlib:temporary AddReference.ID set from storage forceloadlib:temporary LoadingReferences[-1].ID

execute if data storage forceloadlib:temporary LoadingReferences[-1].Duration run data modify storage forceloadlib:temporary AddChunk set from storage forceloadlib:temporary LoadingReferences[-1]
execute if data storage forceloadlib:temporary LoadingReferences[-1].Duration run function forceloadlib:zprivate/add/timer_chunks/set_removal_timestamp
data remove storage forceloadlib:temporary AddChunk

execute if data storage forceloadlib:temporary LoadingReferences[-1].Command run function forceloadlib:zprivate/add/run_command with storage forceloadlib:temporary LoadingReferences[-1]
function forceloadlib:zprivate/add/loading_chunks/remove_loading_tag with storage forceloadlib:temporary LoadingReferences[-1]
data remove storage forceloadlib:temporary AddReference

# Check the next chunk if there is one
execute if score #ForceloadLib.LoadingReferences ForceloadLib matches 0 run return 0
execute unless data storage forceloadlib:temporary LoadingReferences[1] run return 0
data remove storage forceloadlib:temporary LoadingReferences[-1]
function forceloadlib:zprivate/add/loading_chunks/check with storage forceloadlib:temporary LoadingReferences[-1]
