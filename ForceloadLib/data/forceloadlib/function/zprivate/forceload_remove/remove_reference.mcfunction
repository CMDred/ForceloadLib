# Remove 1 from Refcount and reset Refcount.Temporary
$scoreboard players operation #ForceloadLib.Dim"$(Dimension)".X$(ChunkX).Z$(ChunkZ) ForceloadLib.Refcount -= #ForceloadLib.Dim"$(Dimension)".X$(ChunkX).Z$(ChunkZ) ForceloadLib.Refcount.Temporary
$scoreboard players set #ForceloadLib.Dim"$(Dimension)".X$(ChunkX).Z$(ChunkZ) ForceloadLib.Refcount.Temporary 0
$execute unless score #ForceloadLib.Dim"$(Dimension)".X$(ChunkX).Z$(ChunkZ) ForceloadLib.Refcount matches 0 run scoreboard players remove #ForceloadLib.Dim"$(Dimension)".X$(ChunkX).Z$(ChunkZ) ForceloadLib.Refcount 1
$execute if score #ForceloadLib.Dim"$(Dimension)".X$(ChunkX).Z$(ChunkZ) ForceloadLib.Refcount matches 0 run forceload remove $(ChunkX) $(ChunkZ)

# Loop through all loading calls to remove all temporary loading calls for this Chunk, as well as the newest non-temporary loading call if it exists
data modify storage forceloadlib:temporary LoadingChunks set from storage forceloadlib:zprivate LoadingChunks
data remove storage forceloadlib:zprivate LoadingChunks
data modify storage forceloadlib:temporary LoadingChunks append value {}
scoreboard players set #ForceloadLib.FoundNewestCall ForceloadLib 0

execute if data storage forceloadlib:temporary LoadingChunks[1] run function forceloadlib:zprivate/forceload_remove/remove_temporary_calls_loop
data modify storage forceloadlib:zprivate LoadingChunks set from storage forceloadlib:temporary LoadingChunksCopy

data remove storage forceloadlib:temporary RemoveChunk
data remove storage forceloadlib:temporary AddChunk
data remove storage forceloadlib:temporary LoadingChunks
data remove storage forceloadlib:temporary LoadingChunksCopy
