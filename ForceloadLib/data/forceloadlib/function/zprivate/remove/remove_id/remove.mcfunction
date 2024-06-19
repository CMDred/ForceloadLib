# Remove the reference with the ID (Unless it's loading and forced)
execute if data storage forceloadlib:temporary {CurrentReference:{Loading:1b,Force:1b}} run return 0

# Remove reference from "loading" or "timer" list
execute if data storage forceloadlib:temporary CurrentReference.Loading run function forceloadlib:zprivate/remove/loading_chunks/remove_from_list with storage forceloadlib:temporary CurrentReference
execute if data storage forceloadlib:temporary CurrentReference.RemovalTimestamp run function forceloadlib:zprivate/remove/timer_chunks/remove_from_list with storage forceloadlib:temporary CurrentReference

# Save to chunk storage or unforceload chunk if no references remain
data remove storage forceloadlib:temporary RemoveChunk.References[-1]
execute unless data storage forceloadlib:temporary UnremovableReferences if data storage forceloadlib:temporary {RemoveChunk:{References:[]}} run return run function forceloadlib:zprivate/remove/remove_forceload with storage forceloadlib:temporary RemoveChunk

data modify storage forceloadlib:temporary RemoveChunk.References append from storage forceloadlib:temporary UnremovableReferences[]
function forceloadlib:zprivate/remove/remove_id/save_chunk with storage forceloadlib:temporary CurrentReference
