# Lantern Load
scoreboard players set #ForceloadLib load.status 1
scoreboard players set #ForceloadLib.Version load.status 1

# Init
scoreboard objectives add ForceloadLib dummy
execute unless score #ForceloadLib.Init ForceloadLib matches 1 run function forceloadlib:zprivate/init

# Tellraw
execute if score #ForceloadLib.ShowLoadMessage ForceloadLib matches 1 run tellraw @a ["",{text:"□ ForceloadLib >> ",color:"#51B54F"},{text:"Made by CMDred",click_event:{action:"open_url",url:"https://www.youtube.com/BluesProductionTeam"},hover_event:{action:"show_text",value:[{text:"YouTube: ",color:"dark_aqua"},{text:"CMDred",color:"white"}]}},"\n",{text:"□ ForceloadLib >> ",color:"#51B54F"},"Get the latest updates: ",{text:"Modrinth",color:"#5491F7",click_event:{action:"open_url",url:"https://modrinth.com/datapack/forceloadlib"},hover_event:{action:"show_text",value:["Open page"]}},", ",{text:"GitHub",color:"#5491F7",click_event:{action:"open_url",url:"https://github.com/CMDred/ForceloadLib"},hover_event:{action:"show_text",value:["Open page"]}}]
