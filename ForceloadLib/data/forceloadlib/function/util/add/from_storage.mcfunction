########################################################################################################################################
##                                                             HOW TO USE                                                             ##
########################################################################################################################################
## 1. Set the 'forceloadlib:util Add' storage:                                                                                        ##
##    {Dimension:'...',Pos:[<X>,<Y>,<Z>],Namespace:'...',<Optional Parameters>}                                                       ##
## 2. Run this function with the storage as the macro source                                                                          ##
## 3. The return value of this function is the reference's ID                                                                         ##
## 4. As soon as the chunk is loaded:                                                                                                 ##
##    - The '#ForceloadLib.ChunkLoaded ForceloadLib' score is set to the reference's ID                                               ##
##    - The 'forceloadlib:event ChunkLoaded' storage is set to contain the Dimension and the X & Z coordinates of the chunk           ##
##    - The #forceloadlib:chunk_loaded function tag is executed with that storage                                                     ##
##                                                                                                                                    ##
## Note: Always include the dimension's namespace                                                                                     ##
########################################################################################################################################
##                                                        Optional Parameters                                                         ##
########################################################################################################################################
## Command (String): This command will be executed when the 'CommandTrigger' condition is met                                         ##
## CommandTrigger [Values: 1-2]: Defaults to 1                                                                                        ##
##                               1: The command will execute as soon as the chunk loads                                               ##
##                               2: The command will execute instantly (If the chunk is already loaded) or as soon as the chunk loads ##
## Duration (Integer): The number of ticks before the reference is automatically removed                                              ##
## Force [Value: 1b]: Makes the reference unremovable before the chunk is loaded                                                      ##
## Protected [Value: 1b]: Makes the reference unremovable, except for via direct ID access                                            ##
########################################################################################################################################

# Position the command for cheap ~ ~ ~
data modify storage forceloadlib:temporary AddChunk.Dimension set from storage forceloadlib:util Add.Dimension
data modify storage forceloadlib:temporary AddChunk.X set from storage forceloadlib:util Add.Pos[0]
data modify storage forceloadlib:temporary AddChunk.Y set from storage forceloadlib:util Add.Pos[1]
data modify storage forceloadlib:temporary AddChunk.Z set from storage forceloadlib:util Add.Pos[2]
return run function forceloadlib:zprivate/add/from_storage_2 with storage forceloadlib:temporary AddChunk
