# Add 1 to Chunk's Score
$execute store result score #ForceloadLib.LegacyForceloadCheck ForceloadLib run scoreboard players add #ForceloadLib.Dim"$(Dimension)".X$(ChunkX).Z$(ChunkZ) ForceloadLib.Refcount 1
$execute if data storage forceloadlib:temporary AddChunk.Temporary run scoreboard players add #ForceloadLib.Dim"$(Dimension)".X$(ChunkX).Z$(ChunkZ) ForceloadLib.Refcount.Temporary 1

# Check if the Chunk was already forceloaded without ForceloadLib (= Legacy Forceload Chunk)
execute store success score #ForceloadLib.LegacyForceloadCheck2 ForceloadLib run forceload add ~ ~
execute if score #ForceloadLib.LegacyForceloadCheck ForceloadLib matches 1 if score #ForceloadLib.LegacyForceloadCheck2 ForceloadLib matches 0 run function forceloadlib:zprivate/forceload_add/mark_legacy_forceload with storage forceloadlib:temporary AddChunk
