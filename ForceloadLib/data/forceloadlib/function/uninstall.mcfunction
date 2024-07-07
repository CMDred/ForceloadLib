# Check
scoreboard objectives add ForceloadLib.Uninstall dummy
execute store success score #ForceloadLib ForceloadLib.Uninstall run scoreboard objectives remove ForceloadLib
execute if score #ForceloadLib ForceloadLib.Uninstall matches 0 run tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"⚠ Could not remove ForceloadLib. Is it already uninstalled?","color":"red"}]
execute if score #ForceloadLib ForceloadLib.Uninstall matches 0 run return run scoreboard objectives remove ForceloadLib.Uninstall
scoreboard objectives remove ForceloadLib.Uninstall

# Tellraw
tellraw @a [{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"Uninstalled ForceloadLib (v1.0.0)","color":"white"},"\n",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"⚠ Due to compatibility reasons, the 'Constant' scoreboard objective was not automatically removed!","color":"red"}]

# Remove Scoreboards

# Remove all references and unforceload the chunks

# Remove Data Storages
data remove storage forceloadlib:zprivate AllChunks
data remove storage forceloadlib:zprivate LoadingReferences
data remove storage forceloadlib:zprivate TimerReferences
data remove storage forceloadlib:util Add
data remove storage forceloadlib:util Remove

# Stop Schedule Loops
