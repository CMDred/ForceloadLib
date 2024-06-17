# Remove the reference with the ID (Unless it's loading and forced)
$data modify storage forceloadlib:temporary RemoveReference set from storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].References[{ID:$(ID)}]
execute unless data storage forceloadlib:temporary RemoveReference run return 0
execute if data storage forceloadlib:temporary RemoveReference.Loading unless data storage forceloadlib:temporary RemoveReference.Force run function forceloadlib:zprivate/remove/loading_chunks/remove_from_list with storage forceloadlib:temporary RemoveReference
execute if data storage forceloadlib:temporary RemoveReference.Duration run function forceloadlib:zprivate/remove/timer_chunks/remove_from_list with storage forceloadlib:temporary RemoveReference
execute unless data storage forceloadlib:temporary {RemoveReference:{Loading:1b,Force:1b}} run function forceloadlib:zprivate/remove/remove_reference_from_chunk_with_id with storage forceloadlib:temporary RemoveReference

# Unforceload if no references remain
$execute store result score #ForceloadLib.ListSize ForceloadLib if data storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].References[]
execute if score #ForceloadLib.ListSize ForceloadLib matches 0 run function forceloadlib:zprivate/remove/remove_forceload with storage forceloadlib:temporary RemoveChunk

data remove storage forceloadlib:temporary RemoveReference
data remove storage forceloadlib:temporary RemoveChunk
