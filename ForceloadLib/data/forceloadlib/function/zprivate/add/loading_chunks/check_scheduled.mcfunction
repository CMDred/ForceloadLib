# Check if any 'loading' chunks are now loaded
data modify storage forceloadlib:temporary LoadingReferences set from storage forceloadlib:zprivate LoadingReferences
data remove storage forceloadlib:zprivate LoadingReferences
function forceloadlib:zprivate/add/loading_chunks/check with storage forceloadlib:temporary LoadingReferences[-1]
data remove storage forceloadlib:temporary LoadingReferences

# Restart loop
execute if score #ForceloadLib.LoadingReferences ForceloadLib matches 1.. run schedule function forceloadlib:zprivate/add/loading_chunks/check_scheduled 1t
