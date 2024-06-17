######################################################################################################################
##                                                    HOW TO USE                                                    ##
######################################################################################################################
## 1. Set the 'forceloadlib:util AddChunk' storage:                                                                 ##
##    {Dimension:'...',X:<int>,Z:<int>,Command:'...',Duration:<int>,Force:<Optional: 1b>,Protected:<Optional: 1b>}  ##
## 2. Run this function with the storage as the macro source                                                        ##
## 3. The return value of this function is the reference's ID                                                       ##
##                                                                                                                  ##
## Note: Always include the dimension's namespace                                                                   ##
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
$execute in $(Dimension) positioned $(X) 0 $(Z) run return run function forceloadlib:util/add/from_both
