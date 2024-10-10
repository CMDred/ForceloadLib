########################################################################################################################################
##                                                             HOW TO USE                                                             ##
########################################################################################################################################
## 1. Set the 'forceloadlib:util Add' storage:                                                                                        ##
##    {Dimension:'...',Pos:[<X>,<Y>,<Z>],Namespace:'...',<Optional Parameters>}                                                       ##
## 2. Run this function from within the desired chunk                                                                                 ##
## 3. The return value of this function is the reference's ID                                                                         ##
## 4. As soon as the chunk is loaded:                                                                                                 ##
##    - The '#ForceloadLib.ChunkLoaded ForceloadLib' score is set to the reference's ID                                               ##
##    - The 'forceloadlib:event ChunkLoaded' storage is set to contain the Dimension and the X & Z coordinates of the chunk           ##
##    - The #forceloadlib:chunk_loaded function tag is executed with that storage                                                     ##
##                                                                                                                                    ##
## Note: Always include the dimension's namespace                                                                                     ##
## Note: This is more efficient than 'from_storage'                                                                                   ##
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

# Align to chunk borders
data modify storage forceloadlib:temporary AddChunk set from storage forceloadlib:util Add
execute store result storage forceloadlib:temporary AddChunk.X int 16 run data get storage forceloadlib:util Add.Pos[0] 0.0625
execute store result storage forceloadlib:temporary AddChunk.Z int 16 run data get storage forceloadlib:util Add.Pos[2] 0.0625

# Add the reference (Unless Duration = 0)
scoreboard players reset #ForceloadLib.ReferenceDuration
execute if data storage forceloadlib:temporary AddChunk.Duration store result score #ForceloadLib.ReferenceDuration ForceloadLib run data get storage forceloadlib:temporary AddChunk.Duration
execute unless score #ForceloadLib.ReferenceDuration ForceloadLib matches 0 run function forceloadlib:zprivate/add/reference with storage forceloadlib:temporary AddChunk

# Check if the chunk is already loaded
execute if loaded ~ 0 ~ unless score #ForceloadLib.ReferenceDuration ForceloadLib matches 0 run forceload add ~ ~
execute if loaded ~ 0 ~ if data storage forceloadlib:temporary AddChunk.Command if data storage forceloadlib:temporary {AddChunk:{CommandTrigger:2}} run return run function forceloadlib:zprivate/add/run_command with storage forceloadlib:temporary AddChunk
execute if loaded ~ 0 ~ run data remove storage forceloadlib:temporary AddChunk
execute if loaded ~ 0 ~ run return run scoreboard players get #ForceloadLib.ReferenceID ForceloadLib


# Add chunk to "loading" list
execute if score #ForceloadLib.ReferenceDuration ForceloadLib matches 0 run function forceloadlib:zprivate/add/no_duration/prepare_loading with storage forceloadlib:temporary AddChunk

forceload add ~ ~
data modify storage forceloadlib:zprivate LoadingReferences append from storage forceloadlib:temporary AddChunk
data remove storage forceloadlib:temporary AddChunk
scoreboard players add #ForceloadLib.LoadingReferences ForceloadLib 1
schedule function forceloadlib:zprivate/add/loading_chunks/check_scheduled 1t
return run scoreboard players get #ForceloadLib.ReferenceID ForceloadLib
