############################################################################################
##                                       HOW TO USE                                       ##
############################################################################################
## 1. Run this function with the "ID:<int>" macro variable                                ##
## 2. The reference with a matching ID will be removed if possible                        ##
## 3. If the chunk loses its last reference, it will stop being forceloaded               ##
##                                                                                        ##
## Note: Using IDs is faster                                                              ##
############################################################################################

# Get the reference's chunk & remove the reference
$data modify storage forceloadlib:temporary RemoveChunk set from storage forceloadlib:zprivate AllChunks[{Namespaces:[{References:[{ID:$(ID)}]}]}]
#execute unless data storage forceloadlib:temporary RemoveChunk run return 0
$data modify storage forceloadlib:temporary Reference set from storage forceloadlib:zprivate AllChunks[].Namespaces[].References[{ID:$(ID)}]
$data remove storage forceloadlib:temporary RemoveChunk.Namespaces[].References[{ID:$(ID)}]

# Remove the "loading" or "timer" reference from its list (Maybe there's a good way that doesn't require the extra macro call for saving the reference temporarily? To Do: 1 for loading the chunk, 1 for saving it. To remove the reference, use a loop like before)
execute if data storage forceloadlib:temporary Reference.Loading run function forceloadlib:zprivate/remove/loading_chunks/remove_from_list with storage forceloadlib:temporary Reference
execute if data storage forceloadlib:temporary Reference.RemovalTimestamp run function forceloadlib:zprivate/remove/timer_chunks/remove_from_list with storage forceloadlib:temporary Reference
data remove storage forceloadlib:temporary Reference

# Check if no references remain
execute store result score #ForceloadLib.ReferenceCount ForceloadLib if data storage forceloadlib:temporary RemoveChunk.Namespaces[].References[]
execute if score #ForceloadLib.ReferenceCount ForceloadLib matches 0 run function forceloadlib:zprivate/remove/remove_forceload with storage forceloadlib:temporary RemoveChunk
execute if score #ForceloadLib.ReferenceCount ForceloadLib matches 0 run return run data remove storage forceloadlib:temporary RemoveChunk

# If there are empty namespaces, remove them
data remove storage forceloadlib:temporary RemoveChunk.Namespaces[{References:[]}]
function forceloadlib:zprivate/remove/remove_id/save_chunk with storage forceloadlib:temporary RemoveChunk
