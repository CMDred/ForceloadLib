######################################################################################################################
##                                                    HOW TO USE                                                    ##
######################################################################################################################
## 1. Set the 'forceloadlib:util AddChunk' storage (OPTIONAL):                                                      ##
##    {Command:'...',Duration:<int>,Force:<Optional: 1b>,Protected:<Optional: 1b>}                                  ##
## 2. Run this function from within the desired chunk                                                               ##
## 3. The return value of this function is the reference's ID                                                       ##
######################################################################################################################
##                                                    EXPLANATION                                                   ##
######################################################################################################################
## Command (Optional): This command will be executed as soon as the chunk is loaded.                                ##
## Duration (Optional): The number of ticks before the reference is automatically removed.                          ##
## Force (Optional): Makes the reference unremovable before the chunk is loaded. If 'Duration' is also specified,   ##
##                   the reference cannot be removed before the time runs out, except for via direct ID access.     ##
## Protected (Optional): Makes the reference unremovable, except for via direct ID access.                          ##
######################################################################################################################

# Position the command for cheap ~ ~ ~
tp f-f-f-f-f ~ ~ ~
data modify storage forceloadlib:temporary MarkerData set from entity f-f-f-f-f
data modify storage forceloadlib:util AddChunk.Dimension set from storage forceloadlib:temporary MarkerData.Dimension
data modify storage forceloadlib:util AddChunk.X set from storage forceloadlib:temporary MarkerData.Pos[0]
data modify storage forceloadlib:util AddChunk.Z set from storage forceloadlib:temporary MarkerData.Pos[2]
data remove storage forceloadlib:temporary MarkerData
execute in minecraft:overworld run tp f-f-f-f-f 0 0 0
return run function forceloadlib:util/add/from_both
