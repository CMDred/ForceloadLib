######################################################################################################################
##                                                    HOW TO USE                                                    ##
######################################################################################################################
## 1. Set the 'forceloadlib:util AddChunk' storage:                                                                 ##
##    {Dimension:'...',X:<int>,Z:<int>,Command:'...',Duration:<int>,Force:<Optional: 1b>,Protected:<Optional: 1b>}  ##
## 2. Run this function from within the desired chunk                                                               ##
## 3. The return value of this function is the reference's ID                                                       ##
##                                                                                                                  ##
## Note: Always include the dimension's namespace                                                                   ##
## Note: This is more efficient than 'from_storage' and 'from_position'                                             ##
######################################################################################################################
##                                                    EXPLANATION                                                   ##
######################################################################################################################
## Command (Optional): This command will be executed as soon as the chunk is loaded.                                ##
## Duration (Optional): The number of ticks before the reference is automatically removed.                          ##
## Force (Optional): Makes the reference unremovable before the chunk is loaded. If 'Duration' is also specified,   ##
##                   the reference cannot be removed before the time runs out, except for via direct ID access.     ##
## Protected (Optional): Makes the reference unremovable, except for via direct ID access.                          ##
######################################################################################################################

# Align to chunk borders
data modify storage forceloadlib:temporary AddChunk set from storage forceloadlib:util AddChunk
execute store result storage forceloadlib:temporary AddChunk.X int 16 run data get storage forceloadlib:temporary AddChunk.X 0.0625
execute store result storage forceloadlib:temporary AddChunk.Z int 16 run data get storage forceloadlib:temporary AddChunk.Z 0.0625

# Add the reference
function forceloadlib:zprivate/add/reference with storage forceloadlib:temporary AddChunk

# Check if the chunk is already loaded
execute if loaded ~ 0 ~ run data remove storage forceloadlib:temporary AddChunk
execute if loaded ~ 0 ~ run function forceloadlib:zprivate/add/run_command with storage forceloadlib:util AddChunk
execute if loaded ~ 0 ~ run return run scoreboard players get #ForceloadLib.ReferenceID ForceloadLib

# Add chunk to "loading" list
forceload add ~ ~
data modify storage forceloadlib:zprivate LoadingReferences append from storage forceloadlib:temporary AddChunk
data remove storage forceloadlib:temporary AddChunk
scoreboard players add #ForceloadLib.LoadingReferences ForceloadLib 1
schedule function forceloadlib:zprivate/add/loading_chunks/check_scheduled 1t
return run scoreboard players get #ForceloadLib.ReferenceID ForceloadLib
