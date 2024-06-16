# Check if any 'loading' chunks are now loaded
scoreboard players set #ForceloadLib.NewChunksLoaded ForceloadLib 0

data modify storage forceloadlib:temporary LoadingChunks set from storage forceloadlib:zprivate LoadingChunks
data remove storage forceloadlib:zprivate LoadingChunks
function forceloadlib:zprivate/forceload_add/check_loading with storage forceloadlib:temporary LoadingChunks[-1]
data modify storage forceloadlib:zprivate LoadingChunks set from storage forceloadlib:temporary StillLoadingChunks
data remove storage forceloadlib:temporary LoadingChunks
data remove storage forceloadlib:temporary StillLoadingChunks

# Restart loop
execute if score #ForceloadLib.LoadingChunks ForceloadLib matches 1.. run schedule function forceloadlib:zprivate/forceload_add/check_loading_scheduled 1t
