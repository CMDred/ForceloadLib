# Check
scoreboard objectives add ForceloadLib.Uninstall dummy
execute store success score #ForceloadLib.Init ForceloadLib.Uninstall run scoreboard objectives remove ForceloadLib
execute if score #ForceloadLib.Init ForceloadLib.Uninstall matches 0 run tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"⚠ Could not remove ForceloadLib. Is it already uninstalled?","color":"red"}]
execute if score #ForceloadLib.Init ForceloadLib.Uninstall matches 0 run return run scoreboard objectives remove ForceloadLib.Uninstall
scoreboard objectives remove ForceloadLib.Uninstall

# Tellraw
tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},"Uninstalled ForceloadLib (v1.0.0)\n",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"Click here","color":"dark_red","bold":true,"clickEvent":{"action":"suggest_command","value":"/function forceloadlib:debug/reset_chunk_data"},"hoverEvent":{"action":"show_text","contents":[{"text":"USE AT YOUR OWN RISK","bold":true,"color":"red"}]}}," to remove all forceload data"]

# Remove Scoreboards
scoreboard objectives remove ForceloadLib

scoreboard players reset #ForceloadLib.Init
scoreboard players reset #ForceloadLib.ChunkLoaded
scoreboard players reset #ForceloadLib.ReferenceDuration
scoreboard players reset #ForceloadLib.Duration
scoreboard players reset #ForceloadLib.LoadingReferences
scoreboard players reset #ForceloadLib.TimerReferences
scoreboard players reset #ForceloadLib.IsNotForceloaded
scoreboard players reset #ForceloadLib.IsLegacyForceloaded
scoreboard players reset #ForceloadLib.LoadingReferences
scoreboard players reset #ForceloadLib.IsLoaded
scoreboard players reset #ForceloadLib.HasCommand
scoreboard players reset #ForceloadLib.PotentialNextRemovalTimestamp
scoreboard players reset #ForceloadLib.NextRemovalTimestamp
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

# Stop scheduled functions
schedule clear forceloadlib:zprivate/add/loading_chunks/check_scheduled
schedule clear forceloadlib:zprivate/remove/timer_chunks/check_scheduled
