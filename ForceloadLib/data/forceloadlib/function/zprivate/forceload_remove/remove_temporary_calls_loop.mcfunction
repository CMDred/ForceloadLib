# Remove all temporary calls and the newest regular call (if there is one) if there are no forced "add" calls for this chunk
data remove storage forceloadlib:temporary LoadingChunks[-1]
execute if score #ForceloadLib.FoundNewestCall ForceloadLib matches 1 unless data storage forceloadlib:temporary LoadingChunks[-1].Temporary run data modify storage forceloadlib:temporary LoadingChunksCopy append from storage forceloadlib:temporary LoadingChunks[-1]
execute if score #ForceloadLib.FoundNewestCall ForceloadLib matches 1 unless data storage forceloadlib:temporary LoadingChunks[-1].Temporary run return run execute if data storage forceloadlib:temporary LoadingChunks[1] run function forceloadlib:zprivate/forceload_remove/remove_temporary_calls_loop

data modify storage forceloadlib:temporary AddChunk.Dimension set from storage forceloadlib:temporary LoadingChunks[-1].Dimension
data modify storage forceloadlib:temporary AddChunk.ChunkX set from storage forceloadlib:temporary LoadingChunks[-1].ChunkX
data modify storage forceloadlib:temporary AddChunk.ChunkZ set from storage forceloadlib:temporary LoadingChunks[-1].ChunkZ
execute store success score #ForceloadLib.NotSameChunk ForceloadLib run data modify storage forceloadlib:temporary AddChunk set from storage forceloadlib:temporary RemoveChunk
execute if score #ForceloadLib.NotSameChunk ForceloadLib matches 0 if score #ForceloadLib.FoundNewestCall ForceloadLib matches 0 unless data storage forceloadlib:temporary LoadingChunks[-1].Temporary run scoreboard players set #ForceloadLib.FoundNewestCall ForceloadLib 1
execute if score #ForceloadLib.NotSameChunk ForceloadLib matches 0 run scoreboard players remove #ForceloadLib.LoadingChunks ForceloadLib 1
execute if score #ForceloadLib.NotSameChunk ForceloadLib matches 1 run data modify storage forceloadlib:temporary LoadingChunksCopy append from storage forceloadlib:temporary LoadingChunks[-1]

# Start next loop
execute if data storage forceloadlib:temporary LoadingChunks[1] run function forceloadlib:zprivate/forceload_remove/remove_temporary_calls_loop
