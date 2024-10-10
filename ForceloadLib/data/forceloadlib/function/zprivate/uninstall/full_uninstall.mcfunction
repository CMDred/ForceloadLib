# Remove forceload data
function forceloadlib:debug/reset_chunk_data

# Remove Data Storages
data remove storage forceloadlib:util Add
data remove storage forceloadlib:util Remove

# Remove scoreboards
scoreboard players reset #ForceloadLib.ShowLoadMessage

scoreboard players reset #ForceloadLib.Init
scoreboard players reset #ForceloadLib.Version
scoreboard players reset #ForceloadLib.ChunkLoaded
scoreboard players reset #ForceloadLib.ReferenceDuration
scoreboard players reset #ForceloadLib.Duration
scoreboard players reset #ForceloadLib.IsForceloaded
scoreboard players reset #ForceloadLib.IsLegacyForceloaded
scoreboard players reset #ForceloadLib.IsLoaded
scoreboard players reset #ForceloadLib.HasCommand
scoreboard players reset #ForceloadLib.RemovalTimestamp
scoreboard players reset #ForceloadLib.ListSize
scoreboard players reset #ForceloadLib.ReferenceCount
scoreboard players reset #ForceloadLib.NamespaceCount
scoreboard players reset #ForceloadLib.IsWrongNamespace
scoreboard players reset #ForceloadLib.RemovedReference

scoreboard objectives remove ForceloadLib
scoreboard objectives remove ForceloadLib.ChunkID
