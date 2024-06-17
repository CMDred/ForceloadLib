# Check if any 'loading' chunks are now loaded
data modify storage forceloadlib:temporary LoadingChunks set from storage forceloadlib:zprivate LoadingChunks
data remove storage forceloadlib:zprivate LoadingChunks
function forceloadlib:zprivate/add/loading_chunks/check with storage forceloadlib:temporary LoadingChunks[-1]
data remove storage forceloadlib:temporary LoadingChunks

# Restart loop
execute if score #ForceloadLib.LoadingChunks ForceloadLib matches 1.. run schedule function forceloadlib:zprivate/add/loading_chunks/check_scheduled 1t
