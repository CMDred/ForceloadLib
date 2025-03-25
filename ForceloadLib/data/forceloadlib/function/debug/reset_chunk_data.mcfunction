tellraw @s ["",{text:"□ ForceloadLib >> ",color:"#51B54F"},{text:"Removed all forceload data",color:"red"}]

# Reset all forceload references from all chunks, unforceload those chunks & reset the ReferenceID score
data remove storage forceloadlib:zprivate TimerReferences
data remove storage forceloadlib:zprivate LoadingReferences

execute store result score #ForceloadLib.AllChunks ForceloadLib if data storage forceloadlib:zprivate AllChunks[]
function forceloadlib:zprivate/debug/reset_chunk_data with storage forceloadlib:zprivate AllChunks[-1]
scoreboard players reset #ForceloadLib.AllChunks
data remove storage forceloadlib:zprivate AllChunks

scoreboard players reset #ForceloadLib.ReferenceID

# Stop scheduled functions
schedule clear forceloadlib:zprivate/add/loading_chunks/check_scheduled
schedule clear forceloadlib:zprivate/remove/timer_chunks/check_scheduled

# Remove Scoreboards
scoreboard players reset #ForceloadLib.LoadingReferences
scoreboard players reset #ForceloadLib.TimerReferences
scoreboard players reset #ForceloadLib.NextRemovalTimestamp
