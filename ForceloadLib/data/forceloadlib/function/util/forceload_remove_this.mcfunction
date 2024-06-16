######################################################################################################
##                                            HOW TO USE                                            ##
######################################################################################################
## 1. Set the 'forceloadlib:forceload_remove Chunk' storage:                                        ##
##    {Dimension:'foo:bar',X:<int>,Z:<int>}                                                         ##
## 2. Run this function in the correct chunk                                                        ##
## 3. The chunk will only stop being forceloaded when 'remove' was run as often as 'add'            ##
##                                                                                                  ##
## Note: Always include the dimension's namespace                                                   ##
## Note: Any temporary forceload calls will be removed when 'forceload_remove' is run               ##
## Note: If a chunk was already forceloaded without ForceloadLib, it will not be removable          ##
##       with 'forceload_remove'                                                                    ##
## Note: This is more efficient than 'forceload_remove'                                             ##
######################################################################################################

# Align to chunk borders
data modify storage forceloadlib:temporary RemoveChunk set from storage forceloadlib:forceload_remove Chunk
execute store result storage forceloadlib:temporary RemoveChunk.ChunkX int 16 run data get storage forceloadlib:temporary RemoveChunk.X 0.0625
execute store result storage forceloadlib:temporary RemoveChunk.ChunkZ int 16 run data get storage forceloadlib:temporary RemoveChunk.Z 0.0625

# Check if the Chunk is forceloaded with ForceloadLib
execute store result score #ForceloadLib.HasRefcount ForceloadLib run function forceloadlib:zprivate/forceload_remove/check_forceload_status with storage forceloadlib:temporary RemoveChunk
execute if score #ForceloadLib.HasRefcount ForceloadLib matches 0 run return run data remove storage forceloadlib:temporary RemoveChunk

# Make the removal call wait if there's a 'Force:1b' forceload call that's still in progress
scoreboard players set #ForceloadLib.NoForcedCallExists ForceloadLib 1
data remove storage forceloadlib:temporary RemoveChunk.X
data remove storage forceloadlib:temporary RemoveChunk.Z
execute unless loaded ~ 0 ~ run function forceloadlib:zprivate/forceload_remove/search_forced_call
execute if score #ForceloadLib.NoForcedCallExists ForceloadLib matches 1 run return run function forceloadlib:zprivate/forceload_remove/remove_reference with storage forceloadlib:temporary RemoveChunk

# Add to the "Waiting" list
scoreboard players add #ForceloadLib.WaitingChunks ForceloadLib 1
data modify storage forceloadlib:zprivate WaitingChunks append from storage forceloadlib:temporary RemoveChunk
schedule function forceloadlib:zprivate/forceload_remove/check_waiting_scheduled 1t

data remove storage forceloadlib:temporary RemoveChunk
data remove storage forceloadlib:temporary AddChunk
