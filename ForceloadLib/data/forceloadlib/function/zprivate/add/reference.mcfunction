# Check if the chunk is legacy forceloaded
scoreboard players set #ForceloadLib.IsLegacyForceloaded ForceloadLib 0
execute store success score #ForceloadLib.HasNoForceload ForceloadLib run forceload add ~ ~
$execute if score #ForceloadLib.HasNoForceload ForceloadLib matches 0 unless data storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}] run scoreboard players set #ForceloadLib.IsLegacyForceloaded ForceloadLib 1
execute if score #ForceloadLib.IsLegacyForceloaded ForceloadLib matches 1 run return 0

# Add the reference to the chunk
data modify storage forceloadlib:temporary AddReference set value {}
execute store result storage forceloadlib:temporary AddChunk.ID int 1 store result storage forceloadlib:temporary AddReference.ID int 1 run scoreboard players add #ForceloadLib.ReferenceID ForceloadLib 1
execute unless loaded ~ 0 ~ run data modify storage forceloadlib:temporary AddReference.Loading set value 1b
execute if loaded ~ 0 ~ if score #ForceloadLib.ReferenceDuration ForceloadLib matches 1.. run function forceloadlib:zprivate/add/timer_chunks/set_removal_timestamp
execute unless loaded ~ 0 ~ run data modify storage forceloadlib:temporary AddReference.Force set from storage forceloadlib:temporary AddChunk.Force
data modify storage forceloadlib:temporary AddReference.Protected set from storage forceloadlib:temporary AddChunk.Protected
$data modify storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].Namespaces[{Namespace:"$(Namespace)"}].References append from storage forceloadlib:temporary AddReference
data remove storage forceloadlib:temporary AddReference
