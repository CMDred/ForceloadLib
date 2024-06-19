# Remove the last removable reference from the chunk & the "loading" and "timer" lists
data remove storage forceloadlib:temporary RemoveChunk.References[-1]
execute if data storage forceloadlib:temporary CurrentReference.Loading run function forceloadlib:zprivate/remove/loading_chunks/remove_from_list with storage forceloadlib:temporary CurrentReference
execute if data storage forceloadlib:temporary CurrentReference.RemovalTimestamp run function forceloadlib:zprivate/remove/timer_chunks/remove_from_list with storage forceloadlib:temporary CurrentReference
