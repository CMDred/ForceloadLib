# Does similar things to "reference", but it only prepares the storages so it can add the reference to the "loading" list
data modify storage forceloadlib:temporary AddReference set value {}
execute store result storage forceloadlib:temporary AddChunk.ID int 1 store result storage forceloadlib:temporary AddReference.ID int 1 run scoreboard players add #ForceloadLib.ReferenceID ForceloadLib 1
data modify storage forceloadlib:temporary AddReference.Loading set value 1b
data modify storage forceloadlib:temporary AddReference.Force set from storage forceloadlib:temporary AddChunk.Force
data modify storage forceloadlib:temporary AddReference.Protected set from storage forceloadlib:temporary AddChunk.Protected
$data modify storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].Namespaces[{Namespace:"$(Namespace)"}].References append from storage forceloadlib:temporary AddReference
data remove storage forceloadlib:temporary AddReference
