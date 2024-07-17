# Load the chunk's references
$data modify storage forceloadlib:temporary RemoveChunk.Namespaces set from storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].Namespaces

# Filter for the correct namespace (Put it in "forceloadlib:temporary RemoveChunk.References")
execute store result score #ForceloadLib.NamespaceCount ForceloadLib if data storage forceloadlib:temporary RemoveChunk.Namespaces[]
execute if score #ForceloadLib.NamespaceCount ForceloadLib matches 0 run return 0
execute store result score #ForceloadLib.ReferenceCount ForceloadLib if data storage forceloadlib:temporary RemoveChunk.Namespaces[].References[]
function forceloadlib:zprivate/remove/remove_last/filter_namespace

# Stop if the chunk has no references with this namespace
execute unless data storage forceloadlib:temporary RemoveChunk.References run return 0

# Modify the chunk's references: Remove the last removable reference from that namespace (Not Forced & Loading, not Protected)
scoreboard players set #ForceloadLib.RemovedReference ForceloadLib 0

execute store result score #ForceloadLib.ListSize ForceloadLib if data storage forceloadlib:temporary RemoveChunk.References[]
function forceloadlib:zprivate/remove/remove_last/check_loop
data modify storage forceloadlib:temporary RemoveChunk.References append from storage forceloadlib:temporary UnremovableReferences[]
data remove storage forceloadlib:temporary UnremovableReferences
data remove storage forceloadlib:temporary CurrentReference
execute if score #ForceloadLib.RemovedReference ForceloadLib matches 0 run return 0

# Unforceload if no references remain (Note: The value that's put in the ReferenceCount is 1 higher because the data storage it pulls the number from doesn't get edited)
execute if score #ForceloadLib.ReferenceCount ForceloadLib matches 1 run return run function forceloadlib:zprivate/remove/remove_forceload with storage forceloadlib:temporary RemoveChunk

# Remove the namespace if it's empty
execute if data storage forceloadlib:temporary {RemoveChunk:{References:[]}} run return run function forceloadlib:zprivate/remove/remove_last/remove_namespace with storage forceloadlib:temporary RemoveChunk

# Save the chunk's references if neither of the 2 above are true
function forceloadlib:zprivate/remove/remove_last/save_chunk with storage forceloadlib:temporary RemoveChunk
