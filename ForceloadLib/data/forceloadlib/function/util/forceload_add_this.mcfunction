##########################################################################################################
##                                              HOW TO USE                                              ##
##########################################################################################################
## 1. Set the 'forceloadlib:forceload_add Chunk' storage:                                               ##
##    {Dimension:'foo:bar',X:<int>,Z:<int>,Command:"...",Temporary:<Optional: 1b>,Force:<Optional: 1b>} ##
## 2. Run this function in the chunk you want to add                                                    ##
## 3. The 'Command' is run once the chunk is loaded                                                     ##
## 4. Running this function again with the same chunk will not overwrite                                ##
##    the previous call                                                                                 ##
## 5. If 'Temporary' is set to 1b, the call will be removed on reload                                   ##
## 6. If 'Force' is set to 1b, this call cannot be interrupted by a 'forceload_remove' call or a reload ##
##                                                                                                      ##
## Note: Always include the dimension's namespace                                                       ##
## Note: The 'Command' field is optional                                                                ##
## Note: The 'Temporary' field is optional and defaults to 0b                                           ##
## Note: The 'Force' field is optional and defaults to 0b                                               ##
## Note: This is more efficient than 'forceload_add'                                                    ##
##########################################################################################################

# Align to chunk borders
data modify storage forceloadlib:temporary AddChunk set from storage forceloadlib:forceload_add Chunk
execute store result storage forceloadlib:temporary AddChunk.ChunkX int 16 run data get storage forceloadlib:temporary AddChunk.X 0.0625
execute store result storage forceloadlib:temporary AddChunk.ChunkZ int 16 run data get storage forceloadlib:temporary AddChunk.Z 0.0625

# Add Reference
function forceloadlib:zprivate/forceload_add/add_reference with storage forceloadlib:temporary AddChunk

# Check if the chunk is already loaded
execute if loaded ~ 0 ~ if data storage forceloadlib:temporary AddChunk.Command run function forceloadlib:zprivate/forceload_add/run_command with storage forceloadlib:temporary AddChunk
execute if loaded ~ 0 ~ run return run data remove storage forceloadlib:temporary AddChunk

# Add Chunk to "loading" list
forceload add ~ ~
data remove storage forceloadlib:temporary AddChunk.X
data remove storage forceloadlib:temporary AddChunk.Z
data modify storage forceloadlib:zprivate LoadingChunks append from storage forceloadlib:temporary AddChunk
data remove storage forceloadlib:temporary AddChunk
scoreboard players add #ForceloadLib.LoadingChunks ForceloadLib 1
schedule function forceloadlib:zprivate/forceload_add/check_loading_scheduled 1t
