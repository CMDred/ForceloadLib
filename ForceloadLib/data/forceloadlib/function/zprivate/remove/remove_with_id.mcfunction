# Remove the reference with the ID (Unless it's loading and forced)
$data modify storage forceloadlib:temporary RemoveReference set from storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].References[{ID:$(ID)}]
execute unless data storage forceloadlib:temporary RemoveReference run return run data remove storage forceloadlib:temporary RemoveReference
execute if data storage forceloadlib:temporary {RemoveReference:{Loading:1b,Force:1b}} run return run data remove storage forceloadlib:temporary RemoveReference

execute if data storage forceloadlib:temporary RemoveReference.Loading run function forceloadlib:zprivate/remove/loading_chunks/remove_from_list with storage forceloadlib:temporary RemoveReference
execute if data storage forceloadlib:temporary RemoveReference.RemovalTimestamp run function forceloadlib:zprivate/remove/timer_chunks/remove_from_list with storage forceloadlib:temporary RemoveReference

function forceloadlib:zprivate/remove/remove_reference_from_chunk_with_id with storage forceloadlib:temporary RemoveReference
data remove storage forceloadlib:temporary RemoveReference
