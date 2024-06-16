# Prepare storages
data modify storage forceloadlib:temporary LoadingChunks set from storage forceloadlib:zprivate LoadingChunks
data modify storage forceloadlib:temporary LoadingChunks append value {}

# Start Loop
function forceloadlib:zprivate/forceload_remove/search_forced_call_loop

data remove storage forceloadlib:temporary LoadingChunks
