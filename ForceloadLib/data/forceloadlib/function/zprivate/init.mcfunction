# Init (When changing the version number, change the scores here and the single text mention in "uninstall")
scoreboard players set #ForceloadLib.Init ForceloadLib 1
scoreboard players set #ForceloadLib.MajorVersion ForceloadLib 1
scoreboard players set #ForceloadLib.MinorVersion ForceloadLib 1
scoreboard players set #ForceloadLib.PatchVersion ForceloadLib 1
execute unless score #ForceloadLib.ShowLoadMessage ForceloadLib matches 0 run scoreboard players set #ForceloadLib.ShowLoadMessage ForceloadLib 1

# Free-to-use scoreboard (Unused in the code)
scoreboard objectives add ForceloadLib.ChunkID dummy

# Tellraw
tellraw @a ["",{text:"□ ForceloadLib >> ",color:"#51B54F"},"Installed ForceloadLib (v",{"score":{"name":"#ForceloadLib.MajorVersion","objective":"ForceloadLib"}},".",{"score":{"name":"#ForceloadLib.MinorVersion","objective":"ForceloadLib"}},".",{"score":{"name":"#ForceloadLib.PatchVersion","objective":"ForceloadLib"}},")"]
tellraw @a ["",{text:"□ ForceloadLib >> ",color:"#51B54F"},{text:"Click here",bold:true,color:"yellow",click_event:{action:"run_command",command:"/function forceloadlib:debug/toggle_load_message"},hover_event:{action:"show_text",value:["/function forceloadlib:debug/toggle_load_message"]}}," to toggle the load message"]
execute if score #ForceloadLib.ShowLoadMessage ForceloadLib matches 1 run tellraw @a ""
