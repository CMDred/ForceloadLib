############################################################################################
##                                       HOW TO USE                                       ##
############################################################################################
## 1. Set the 'forceloadlib:util RemoveChunk' storage:                                    ##
##    {Dimension:'...',X:<int>,Z:<int>,ID:<int>}                                          ##
## 2. Run this function with the storage as the macro source                              ##
## 3. The most recent removable reference on the chunk will be removed                    ##
## 4. If the chunk loses its last reference, it will stop being forceloaded               ##
##                                                                                        ##
## Note: Always include the dimension's namespace                                         ##
## Note: Manually forceloaded chunks will not be affected by ForceloadLib                 ##
############################################################################################
##                                       EXPLANATION                                      ##
############################################################################################
## ID (Optional): If specified, it will try to remove a specific reference with that ID.  ##
############################################################################################

# Align to chunk borders
data modify storage forceloadlib:temporary RemoveChunk set from storage forceloadlib:util RemoveChunk
execute store result storage forceloadlib:temporary RemoveChunk.X int 16 run data get storage forceloadlib:temporary RemoveChunk.X 0.0625
execute store result storage forceloadlib:temporary RemoveChunk.Z int 16 run data get storage forceloadlib:temporary RemoveChunk.Z 0.0625

# Try to remove the chunk's most recent removable reference (or the reference with the matching ID)
execute if data storage forceloadlib:temporary RemoveChunk.ID run return run function forceloadlib:zprivate/remove/remove_with_id with storage forceloadlib:temporary RemoveChunk
function forceloadlib:zprivate/remove/remove_last with storage forceloadlib:temporary RemoveChunk
data remove storage forceloadlib:temporary RemoveChunk
