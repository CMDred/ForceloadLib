# Check if the Chunk is forceloaded with ForceloadLib
$return run execute if score #ForceloadLib.Dim"$(Dimension)".X$(ChunkX).Z$(ChunkZ) ForceloadLib.Refcount matches 1..
