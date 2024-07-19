# Tellraw
scoreboard players reset #ForceloadLib.RemovalTimestamp
execute store result score #ForceloadLib.RemovalTimestamp ForceloadLib run data get storage forceloadlib:temporary References[0].RemovalTimestamp
execute if score #ForceloadLib.RemovalTimestamp ForceloadLib matches 0.. store result score #ForceloadLib.GameTime ForceloadLib run time query gametime
execute if score #ForceloadLib.RemovalTimestamp ForceloadLib matches 0.. run scoreboard players operation #ForceloadLib.RemovalTimestamp ForceloadLib -= #ForceloadLib.GameTime ForceloadLib

execute if data storage forceloadlib:temporary References[0].Loading unless data storage forceloadlib:temporary References[0].Force run data modify storage forceloadlib:temporary Tellraw.Loading set value ", Loading"
execute if data storage forceloadlib:temporary References[0].Loading if data storage forceloadlib:temporary References[0].Force run data modify storage forceloadlib:temporary Tellraw.Loading set value ", Loading (Forced)"
execute if data storage forceloadlib:temporary References[0].Protected run data modify storage forceloadlib:temporary Tellraw.Protected set value ", Protected"
execute if score #ForceloadLib.RemovalTimestamp ForceloadLib matches 0.. run data modify storage forceloadlib:temporary Tellraw.Duration set value '[", Duration: ",{"score":{"name":"#ForceloadLib.RemovalTimestamp","objective":"ForceloadLib"}}," ticks"]'
tellraw @s ["- ID: ",{"nbt":"References[0].ID","storage":"forceloadlib:temporary"},{"nbt":"Tellraw.Loading","storage":"forceloadlib:temporary"},{"nbt":"Tellraw.Protected","storage":"forceloadlib:temporary"},{"nbt":"Tellraw.Duration","storage":"forceloadlib:temporary","interpret":true}]
data remove storage forceloadlib:temporary Tellraw

# Check next reference
execute if score #ForceloadLib.ReferenceCount ForceloadLib matches 1 run return 0
scoreboard players remove #ForceloadLib.ReferenceCount ForceloadLib 1
data remove storage forceloadlib:temporary References[0]
function forceloadlib:zprivate/debug/show_references/list_references_loop
