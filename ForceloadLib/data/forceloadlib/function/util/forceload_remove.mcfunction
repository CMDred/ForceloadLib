######################################################################################################
##                                            HOW TO USE                                            ##
######################################################################################################
## 1. Set the 'forceloadlib:forceload_remove Chunk' storage:                                        ##
##    {Dimension:'foo:bar',X:<int>,Z:<int>}                                                         ##
## 2. Run this function with the data storage                                                       ##
## 3. The chunk will only stop being forceloaded when 'remove' was run as often as 'add'            ##
##                                                                                                  ##
## Note: Always include the dimension's namespace                                                   ##
## Note: Any temporary forceload calls will be removed when 'forceload_remove' is run               ##
## Note: If a chunk was already forceloaded without ForceloadLib, it will not be removable          ##
##       with 'forceload_remove'                                                                    ##
######################################################################################################

# Position the command for cheap ~ ~ ~
$execute in $(Dimension) positioned $(X) 0 $(Z) run function forceloadlib:util/forceload_remove_this
