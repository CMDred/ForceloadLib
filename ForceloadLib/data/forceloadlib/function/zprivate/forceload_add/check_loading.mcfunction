# Check if the chunk is now loaded
$execute in $(Dimension) store success score #ForceloadLib.IsLoaded ForceloadLib if loaded $(ChunkX) 0 $(ChunkZ)
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 run data modify storage forceloadlib:temporary StillLoadingChunks append from storage forceloadlib:temporary LoadingChunks[-1]
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 run data remove storage forceloadlib:temporary LoadingChunks[-1]
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 0 if data storage forceloadlib:temporary LoadingChunks[1] run return run function forceloadlib:zprivate/forceload_add/check_loading with storage forceloadlib:temporary LoadingChunks[-1]

scoreboard players remove #ForceloadLib.LoadingChunks ForceloadLib 1
scoreboard players set #ForceloadLib.NewChunksLoaded ForceloadLib 1
execute if data storage forceloadlib:temporary LoadingChunks[-1].Command run function forceloadlib:zprivate/forceload_add/run_command with storage forceloadlib:temporary LoadingChunks[-1]

# Check the next chunk if there is one
execute unless data storage forceloadlib:temporary LoadingChunks[1] run return 0
data remove storage forceloadlib:temporary LoadingChunks[-1]
execute if score #ForceloadLib.LoadingChunks ForceloadLib matches 1.. run function forceloadlib:zprivate/forceload_add/check_loading with storage forceloadlib:temporary LoadingChunks[-1]
