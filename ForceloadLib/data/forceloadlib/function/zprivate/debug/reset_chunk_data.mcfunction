# Loop through all chunks and unforceload them
$execute in $(Dimension) run forceload remove $(X) $(Z)
data remove storage forceloadlib:zprivate AllChunks[-1]

# Start the next loop
execute if score #ForceloadLib.AllChunks ForceloadLib matches 1 run return 0
scoreboard players remove #ForceloadLib.AllChunks ForceloadLib 1
function forceloadlib:zprivate/debug/reset_chunk_data with storage forceloadlib:zprivate AllChunks[-1]
