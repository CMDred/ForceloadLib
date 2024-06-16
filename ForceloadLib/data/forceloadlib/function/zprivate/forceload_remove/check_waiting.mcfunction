# Check if the chunk has no "loading" calls anymore
$execute in $(Dimension) store success score #ForceloadLib.IsLoaded ForceloadLib if loaded $(ChunkX) 0 $(ChunkZ)
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 run data modify storage forceloadlib:temporary StillWaitingChunks append from storage forceloadlib:temporary WaitingChunks[-1]
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 1 run scoreboard players remove #ForceloadLib.WaitingChunks ForceloadLib 1
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 1 run function forceloadlib:zprivate/forceload_remove/remove_reference with storage forceloadlib:temporary WaitingChunks[-1]

# Check the next chunk if there is one
execute if score #ForceloadLib.WaitingChunks ForceloadLib matches 0 run return 0
data remove storage forceloadlib:temporary WaitingChunks[-1]
execute if data storage forceloadlib:temporary WaitingChunks[1] run function forceloadlib:zprivate/forceload_add/check_loading with storage forceloadlib:temporary WaitingChunks[-1]
