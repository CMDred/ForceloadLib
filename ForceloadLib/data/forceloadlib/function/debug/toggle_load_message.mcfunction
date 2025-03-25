# Toggle the load message
scoreboard players add #ForceloadLib.ShowLoadMessage ForceloadLib 1
execute unless score #ForceloadLib.ShowLoadMessage ForceloadLib matches 1 run scoreboard players set #ForceloadLib.ShowLoadMessage ForceloadLib 0

# Tellraw
execute if score #ForceloadLib.ShowLoadMessage ForceloadLib matches 0 run tellraw @s ["",{text:"□ ForceloadLib >> ",color:"#51B54F"},"Disabled the load message"]
execute if score #ForceloadLib.ShowLoadMessage ForceloadLib matches 1 run tellraw @s ["",{text:"□ ForceloadLib >> ",color:"#51B54F"},"Enabled the load message"]
