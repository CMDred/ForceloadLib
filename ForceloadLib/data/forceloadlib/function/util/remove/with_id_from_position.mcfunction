############################################################################################
##                                       HOW TO USE                                       ##
############################################################################################
## 1. Run this function with the "ID:<int>" macro variable and from within the chunk      ##
## 2. The reference with a matching ID will be removed if possible                        ##
## 3. If the chunk loses its last reference, it will stop being forceloaded               ##
##                                                                                        ##
## Note: This is even faster than the regular "with_id" method                            ##
############################################################################################
##                                       EXPLANATION                                      ##
############################################################################################
## ID: It will try to remove a specific reference with that ID.                           ##
############################################################################################

# Get the reference's chunk & remove the reference
$data modify storage forceloadlib:temporary RemoveChunk set from storage forceloadlib:zprivate AllChunks[{References:[{ID:$(ID)}]}]
execute if data storage forceloadlib:temporary RemoveChunk run function forceloadlib:zprivate/remove/remove_id/from_position/main
data remove storage forceloadlib:temporary RemoveChunk
