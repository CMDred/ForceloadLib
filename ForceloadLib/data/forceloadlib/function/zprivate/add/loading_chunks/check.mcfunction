# Check if the chunk is now loaded
$execute in $(Dimension) store success score #ForceloadLib.IsLoaded ForceloadLib if loaded $(X) 0 $(Z)

# Chunk is loaded
execute if score #ForceloadLib.IsLoaded ForceloadLib matches 1 run return run function forceloadlib:zprivate/add/loading_chunks/is_loaded

# Chunk is not loaded, go to the next one
data modify storage forceloadlib:zprivate LoadingReferences append from storage forceloadlib:temporary LoadingReferences[-1]
data remove storage forceloadlib:temporary LoadingReferences[-1]
execute if data storage forceloadlib:temporary LoadingReferences[1] run function forceloadlib:zprivate/add/loading_chunks/check with storage forceloadlib:temporary LoadingReferences[-1]
