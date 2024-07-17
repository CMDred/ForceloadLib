########################################################################################################################################
##                                                             HOW TO USE                                                             ##
########################################################################################################################################
## 1. Set the 'forceloadlib:util Add' storage:                                                                                        ##
##    {Dimension:'...',Pos:[<X>,<Y>,<Z>],Namespace:'...',Command:'...',Duration:<int>,Force:<Optional: 1b>,Protected:<Optional: 1b>}  ##
## 2. Run this function with the storage as the macro source                                                                          ##
## 3. The return value of this function is the reference's ID                                                                         ##
##                                                                                                                                    ##
## Note: Always include the dimension's namespace                                                                                     ##
########################################################################################################################################
##                                                             EXPLANATION                                                            ##
########################################################################################################################################
## Command (Optional): This command will be executed at the Pos as soon as the chunk is loaded.                                       ##
## Duration (Optional): The number of ticks before the reference is automatically removed.                                            ##
## Force (Optional): Makes the reference unremovable before the chunk is loaded. If 'Duration' is also specified,                     ##
##                   the reference cannot be removed before the time runs out, except for via direct ID access.                       ##
## Protected (Optional): Makes the reference unremovable, except for via direct ID access.                                            ##
########################################################################################################################################

# Position the command for cheap ~ ~ ~
data modify storage forceloadlib:temporary AddChunk.Dimension set from storage forceloadlib:util Add.Dimension
data modify storage forceloadlib:temporary AddChunk.X set from storage forceloadlib:util Add.Pos[0]
data modify storage forceloadlib:temporary AddChunk.Y set from storage forceloadlib:util Add.Pos[1]
data modify storage forceloadlib:temporary AddChunk.Z set from storage forceloadlib:util Add.Pos[2]
return run function forceloadlib:zprivate/add/from_storage_2 with storage forceloadlib:temporary AddChunk
