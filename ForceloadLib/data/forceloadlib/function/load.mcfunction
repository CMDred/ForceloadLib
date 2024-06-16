# Init
scoreboard objectives add ForceloadLib dummy
execute unless score #ForceloadLib.Init ForceloadLib matches 1 run function forceloadlib:init

# Tellraw
tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"Made by CMDred","clickEvent":{"action":"open_url","value":"https://www.youtube.com/BluesProductionTeam"},"hoverEvent":{"action":"show_text","contents":[{"text":"YouTube: ","color":"dark_aqua"},{"text":"CMDred","color":"white"}]}}]

# Remove all temporary forceload calls
#...
# - Loop through all temporary forceload calls (Is a storage)
# - Remove the storage entry and remove from the "Temporary" Refcount.
# - If the total refcount is 0: Reset the fake player
# - Some sort of logic needs to be added so it doesn't use multiple macros to remove and then reset back to 0 if all the calls are already gone
