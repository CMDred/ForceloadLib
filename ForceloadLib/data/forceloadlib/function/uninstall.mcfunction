############################################################################################################
##                                               HOW TO USE                                               ##
############################################################################################################
## Update ForceloadLib:                                                                                   ##
## 1. Run this function                                                                                   ##
## 2. Replace the datapack with the newer version                                                         ##
## 3. Reload                                                                                              ##
##                                                                                                        ##
## Uninstall ForceloadLib:                                                                                ##
## 1. Run this function                                                                                   ##
## 2. Click the red 'CLICK HERE' text to remove all remaining chunk data & references                     ##
## 3. Remove the datapack                                                                                 ##
############################################################################################################

# Check
scoreboard objectives add ForceloadLib.Uninstall dummy
execute store success score #ForceloadLib.Init ForceloadLib.Uninstall run scoreboard objectives remove ForceloadLib
execute if score #ForceloadLib.Init ForceloadLib.Uninstall matches 0 run tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"⚠ Could not remove ForceloadLib. Is it already uninstalled?","color":"red"}]
execute if score #ForceloadLib.Init ForceloadLib.Uninstall matches 0 run return run scoreboard objectives remove ForceloadLib.Uninstall
scoreboard objectives remove ForceloadLib.Uninstall

# Tellraw
tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},"Uninstalled ForceloadLib (v1.0.0)\n",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"Click here","color":"dark_red","bold":true,"clickEvent":{"action":"suggest_command","value":"/function forceloadlib:debug/reset_chunk_data"},"hoverEvent":{"action":"show_text","contents":[{"text":"Only use this if you want to uninstall ForceloadLib permanently instead of updating it.","bold":true,"color":"red"}]}}," to remove all forceload data"]

# Remove Scoreboards
scoreboard players reset #ForceloadLib.Init
scoreboard players reset #ForceloadLib.ChunkLoaded
scoreboard players reset #ForceloadLib.ReferenceDuration
scoreboard players reset #ForceloadLib.Duration
scoreboard players reset #ForceloadLib.IsNotForceloaded
scoreboard players reset #ForceloadLib.IsLegacyForceloaded
scoreboard players reset #ForceloadLib.IsLoaded
scoreboard players reset #ForceloadLib.HasCommand
scoreboard players reset #ForceloadLib.RemovalTimestamp
scoreboard players reset #ForceloadLib.ListSize
scoreboard players reset #ForceloadLib.ReferenceCount
scoreboard players reset #ForceloadLib.NamespaceCount
scoreboard players reset #ForceloadLib.GameTime
scoreboard players reset #ForceloadLib.IsWrongNamespace
scoreboard players reset #ForceloadLib.RemovedReference

# Remove Data Storages
data remove storage forceloadlib:util Add
data remove storage forceloadlib:util Remove
