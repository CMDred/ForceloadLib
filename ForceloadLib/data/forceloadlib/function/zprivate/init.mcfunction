# Init (When changing the version number, change the scores here and the single text mention in "uninstall"
scoreboard players set #ForceloadLib.Init ForceloadLib 1
scoreboard players set #ForceloadLib.MajorVersion ForceloadLib 1
scoreboard players set #ForceloadLib.MinorVersion ForceloadLib 1
scoreboard players set #ForceloadLib.PatchVersion ForceloadLib 0
execute unless score #ForceloadLib.ShowLoadMessage ForceloadLib matches 0 run scoreboard players set #ForceloadLib.ShowLoadMessage ForceloadLib 1

# Tellraw
tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},"Installed ForceloadLib (v",{"score":{"name":"#ForceloadLib.MajorVersion","objective":"ForceloadLib"}},".",{"score":{"name":"#ForceloadLib.MinorVersion","objective":"ForceloadLib"}},".",{"score":{"name":"#ForceloadLib.PatchVersion","objective":"ForceloadLib"}},")"]
tellraw @a ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"Click here","bold":true,"color":"yellow","clickEvent":{"action":"run_command","value":"/function forceloadlib:debug/toggle_load_message"},"hoverEvent":{"action":"show_text","contents":["/function forceloadlib:debug/toggle_load_message"]}}," to toggle the load message"]
execute if score #ForceloadLib.ShowLoadMessage ForceloadLib matches 1 run tellraw @a ""
