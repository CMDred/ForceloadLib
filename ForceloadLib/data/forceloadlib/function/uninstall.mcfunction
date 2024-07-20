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

# Check if it's installed
scoreboard objectives add ForceloadLib.Uninstall dummy
execute if score #ForceloadLib.Init ForceloadLib matches 1 run scoreboard players set #ForceloadLib.Init ForceloadLib.Uninstall 1
execute unless score #ForceloadLib.Init ForceloadLib.Uninstall matches 1 run tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"⚠ Could not remove ForceloadLib.\nIs it installed?","color":"red"}]
execute unless score #ForceloadLib.Init ForceloadLib.Uninstall matches 1 run return run scoreboard objectives remove ForceloadLib.Uninstall
scoreboard objectives remove ForceloadLib.Uninstall

# Check version
execute if score #ForceloadLib.MajorVersion ForceloadLib matches 1 if score #ForceloadLib.MinorVersion ForceloadLib matches 1 if score #ForceloadLib.PatchVersion ForceloadLib matches 0 run scoreboard players set #ForceloadLib.CorrectVersion ForceloadLib 1
execute unless score #ForceloadLib.CorrectVersion ForceloadLib matches 1 run return run tellraw @s [{"text":"","color":"red"},{"text":"□ ForceloadLib >> ","color":"#51B54F"},"⚠ Could not remove ForceloadLib (v1.1.0).\nA different version (v",{"score":{"name":"#ForceloadLib.MajorVersion","objective":"ForceloadLib"}},".",{"score":{"name":"#ForceloadLib.MinorVersion","objective":"ForceloadLib"}},".",{"score":{"name":"#ForceloadLib.PatchVersion","objective":"ForceloadLib"}},") is installed."]
scoreboard players reset #ForceloadLib.CorrectVersion

# Tellraw
tellraw @s ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},"Uninstalled ForceloadLib (v",{"score":{"name":"#ForceloadLib.MajorVersion","objective":"ForceloadLib"}},".",{"score":{"name":"#ForceloadLib.MinorVersion","objective":"ForceloadLib"}},".",{"score":{"name":"#ForceloadLib.PatchVersion","objective":"ForceloadLib"}},")\n",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"Click here","color":"dark_red","bold":true,"clickEvent":{"action":"suggest_command","value":"/function forceloadlib:zprivate/uninstall/full_uninstall"},"hoverEvent":{"action":"show_text","contents":[{"text":"Only use this if you want to uninstall ForceloadLib permanently instead of updating it.","bold":true,"color":"red"}]}}," to remove all internal data"]

# Remove scoreboards
scoreboard players reset #ForceloadLib.Init
scoreboard players reset #ForceloadLib.MajorVersion
scoreboard players reset #ForceloadLib.MinorVersion
scoreboard players reset #ForceloadLib.PatchVersion
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
