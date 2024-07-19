# THIS IS A COPY OF "remove/with_id", ONLY WITHOUT THE "remove_from_list" STUFF

# Get the reference's chunk & remove the reference
$data modify storage forceloadlib:temporary RemoveChunk set from storage forceloadlib:zprivate AllChunks[{Namespaces:[{References:[{ID:$(ID)}]}]}]
$data remove storage forceloadlib:temporary RemoveChunk.Namespaces[].References[{ID:$(ID)}]

# Check if no references remain
execute store result score #ForceloadLib.ReferenceCount ForceloadLib if data storage forceloadlib:temporary RemoveChunk.Namespaces[].References[]
execute if score #ForceloadLib.ReferenceCount ForceloadLib matches 0 run function forceloadlib:zprivate/remove/remove_forceload with storage forceloadlib:temporary RemoveChunk
execute if score #ForceloadLib.ReferenceCount ForceloadLib matches 0 run return run data remove storage forceloadlib:temporary RemoveChunk

# If there are empty namespaces, remove them
data remove storage forceloadlib:temporary RemoveChunk.Namespaces[{References:[]}]
function forceloadlib:zprivate/remove/remove_id/save_chunk with storage forceloadlib:temporary RemoveChunk
