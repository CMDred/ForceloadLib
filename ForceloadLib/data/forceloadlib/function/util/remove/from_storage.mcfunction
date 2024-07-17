############################################################################################
##                                       HOW TO USE                                       ##
############################################################################################
## 1. Set the 'forceloadlib:util Remove' storage:                                         ##
##    {Dimension:'...',Pos:[<X>,<Y>,<Z>],Namespace:'...'}                                 ##
## 2. Run this function                                                                   ##
## 3. The most recent removable reference on the chunk will be removed                    ##
## 4. If the chunk loses its last reference, it will stop being forceloaded               ##
##                                                                                        ##
## Note: Always include the dimension's namespace                                         ##
## Note: Manually forceloaded chunks will not be affected by ForceloadLib                 ##
############################################################################################

# Align to chunk borders
data modify storage forceloadlib:temporary RemoveChunk set from storage forceloadlib:util Remove
execute store result storage forceloadlib:temporary RemoveChunk.X int 16 run data get storage forceloadlib:util Remove.Pos[0] 0.0625
execute store result storage forceloadlib:temporary RemoveChunk.Z int 16 run data get storage forceloadlib:util Remove.Pos[2] 0.0625

# Try to remove the chunk's most recent removable reference
function forceloadlib:zprivate/remove/remove_last/main with storage forceloadlib:temporary RemoveChunk
data remove storage forceloadlib:temporary RemoveChunk
