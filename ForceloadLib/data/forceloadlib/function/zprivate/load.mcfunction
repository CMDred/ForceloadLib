# Init
scoreboard objectives add ForceloadLib dummy
execute unless score #ForceloadLib.Init ForceloadLib matches 1 run function forceloadlib:zprivate/init

# Tellraw
execute if score #ForceloadLib.ShowLoadMessage ForceloadLib matches 1 run tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"Made by CMDred","clickEvent":{"action":"open_url","value":"https://www.youtube.com/BluesProductionTeam"},"hoverEvent":{"action":"show_text","contents":[{"text":"YouTube: ","color":"dark_aqua"},{"text":"CMDred","color":"white"}]}},"\n",{"text":"□ ForceloadLib >> ","color":"#51B54F"},"Get the latest updates: ",{"text":"Modrinth","color":"#5491F7","clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/forceloadlib"},"hoverEvent":{"action":"show_text","contents":["Open page"]}},", ",{"text":"GitHub","color":"#5491F7","clickEvent":{"action":"open_url","value":"https://github.com/CMDred/ForceloadLib"},"hoverEvent":{"action":"show_text","contents":["Open page"]}}]
