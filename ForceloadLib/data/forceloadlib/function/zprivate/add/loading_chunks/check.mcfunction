# Check if the chunk is now loaded
$execute in $(Dimension) store success score #ForceloadLib.IsLoaded ForceloadLib if loaded $(X) 0 $(Z)
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 run data modify storage forceloadlib:zprivate LoadingChunks append from storage forceloadlib:temporary LoadingChunks[-1]
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 run data remove storage forceloadlib:temporary LoadingChunks[-1]
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 if data storage forceloadlib:temporary LoadingChunks[1] run return run function forceloadlib:zprivate/add/loading_chunks/check with storage forceloadlib:temporary LoadingChunks[-1]

# Run the command and remove the reference from the "loading" list
scoreboard players remove #ForceloadLib.LoadingChunks ForceloadLib 1
function forceloadlib:zprivate/add/loading_chunks/remove_loading_tag with storage forceloadlib:temporary LoadingChunks[-1]
execute if data storage forceloadlib:temporary LoadingChunks[-1].Duration run function forceloadlib:zprivate/add/loading_chunks/activate_timer
execute if data storage forceloadlib:temporary LoadingChunks[-1].Command run function forceloadlib:zprivate/add/run_command with storage forceloadlib:temporary LoadingChunks[-1]

# Check the next chunk if there is one
execute if score #ForceloadLib.LoadingChunks ForceloadLib matches 0 run return 0
execute unless data storage forceloadlib:temporary LoadingChunks[1] run return 0
data remove storage forceloadlib:temporary LoadingChunks[-1]
function forceloadlib:zprivate/add/loading_chunks/check with storage forceloadlib:temporary LoadingChunks[-1]
