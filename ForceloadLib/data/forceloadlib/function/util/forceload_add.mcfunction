##########################################################################################################
##                                              HOW TO USE                                              ##
##########################################################################################################
## 1. Set the 'forceloadlib:forceload_add Chunk' storage:                                               ##
##    {Dimension:'foo:bar',X:<int>,Z:<int>,Command:"...",Temporary:<Optional: 1b>,Force:<Optional: 1b>} ##
## 2. Run this function with the data storage                                                           ##
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
##########################################################################################################

# Position the command for cheap ~ ~ ~
$execute in $(Dimension) positioned $(X) 0 $(Z) run function forceloadlib:util/forceload_add_this
