# Reset all forceload references from all chunks, unforceload those chunks & reset the ReferenceID score
data remove storage forceloadlib:zprivate TimerReferences
data remove storage forceloadlib:zprivate LoadingReferences

execute store result score #ForceloadLib.AllChunks ForceloadLib if data storage forceloadlib:zprivate AllChunks[]
function forceloadlib:zprivate/debug/reset_chunk_data with storage forceloadlib:zprivate AllChunks[-1]
scoreboard players reset #ForceloadLib.AllChunks
data remove storage forceloadlib:zprivate AllChunks

scoreboard players reset #ForceloadLib.ReferenceID

tellraw @s ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},{"text":"Removed all forceload data","color":"red"}]
