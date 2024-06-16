# Check if there are any forced and in-progress 'Add' calls that this 'Remove' call should wait for. Only stop if you know whether there is a forced temporary forceload call (Need that info in 'remove_reference')
data remove storage forceloadlib:temporary LoadingChunks[-1]
execute unless data storage forceloadlib:temporary LoadingChunks[-1].Force run return run execute if data storage forceloadlib:temporary LoadingChunks[1] run function forceloadlib:zprivate/forceload_remove/search_forced_call_loop

data modify storage forceloadlib:temporary AddChunk.Dimension set from storage forceloadlib:temporary LoadingChunks[-1].Dimension
data modify storage forceloadlib:temporary AddChunk.ChunkX set from storage forceloadlib:temporary LoadingChunks[-1].ChunkX
data modify storage forceloadlib:temporary AddChunk.ChunkZ set from storage forceloadlib:temporary LoadingChunks[-1].ChunkZ
execute store success score #ForceloadLib.NoForcedCallExists ForceloadLib run data modify storage forceloadlib:temporary AddChunk set from storage forceloadlib:temporary RemoveChunk

# Start next loop
execute if score #ForceloadLib.NoForcedCallExists ForceloadLib matches 1 if data storage forceloadlib:temporary LoadingChunks[0] run function forceloadlib:zprivate/forceload_remove/search_forced_call_loop
