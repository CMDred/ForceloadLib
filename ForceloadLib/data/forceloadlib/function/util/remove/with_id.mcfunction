############################################################################################
##                                       HOW TO USE                                       ##
############################################################################################
## 1. Run this function with the "ID:<int>" macro variable                                ##
## 2. The reference with a matching ID will be removed if possible                        ##
## 3. If the chunk loses its last reference, it will stop being forceloaded               ##
##                                                                                        ##
## Note: Using IDs is faster                                                              ##
############################################################################################
##                                       EXPLANATION                                      ##
############################################################################################
## ID: It will try to remove a specific reference with that ID.                           ##
############################################################################################

# Get the reference's chunk & remove the reference
$data modify storage forceloadlib:temporary RemoveChunk set from storage forceloadlib:zprivate AllChunks[{References:[{ID:$(ID)}]}]
execute if data storage forceloadlib:temporary RemoveChunk run function forceloadlib:zprivate/remove/remove_id/main
data remove storage forceloadlib:temporary RemoveChunk
