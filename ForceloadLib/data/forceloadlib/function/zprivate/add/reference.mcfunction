# Add the reference to the chunk
data modify storage forceloadlib:temporary AddReference set value {}
execute store result storage forceloadlib:temporary AddReference.ID int 1 run scoreboard players add #ForceloadLib.ReferenceID ForceloadLib 1
execute unless loaded ~ 0 ~ run data modify storage forceloadlib:temporary AddReference.Loading set value 1b
execute if loaded ~ 0 ~ if data storage forceloadlib:temporary AddChunk.Duration run function forceloadlib:zprivate/add/timer_chunks/set_removal_timestamp
data modify storage forceloadlib:temporary AddReference.Force set from storage forceloadlib:temporary AddChunk.Force
data modify storage forceloadlib:temporary AddReference.Protected set from storage forceloadlib:temporary AddChunk.Protected
$data modify storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(ChunkX),Z:$(ChunkZ)}].References append from from storage forceloadlib:temporary AddReference
data remove storage forceloadlib:temporary AddReference
