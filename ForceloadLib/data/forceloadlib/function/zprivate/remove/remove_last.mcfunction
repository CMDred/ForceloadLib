# Load the chunk's references
$data modify storage forceloadlib:temporary RemoveChunk.References set from storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].References

# Modify the chunk's references: Remove the last removable reference (Not Forced & Loading, not Protected)
execute store result score #ForceloadLib.ListSize ForceloadLib if data storage forceloadlib:temporary RemoveChunk.References[]
function forceloadlib:zprivate/remove/remove_last_loop
data modify storage forceloadlib:temporary RemoveChunk.References append from storage forceloadlib:temporary UnremovableReferences[]
data remove storage forceloadlib:temporary UnremovableReferences
data remove storage forceloadlib:temporary CurrentReference

# Save the chunk's references
$data modify storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].References set from storage forceloadlib:temporary RemoveChunk.References

# Unforceload if no references remain
execute store result score #ForceloadLib.ListSize ForceloadLib if data storage forceloadlib:temporary RemoveChunk.References[]
execute if score #ForceloadLib.ListSize ForceloadLib matches 0 run function forceloadlib:zprivate/remove/remove_forceload with storage forceloadlib:temporary RemoveChunk
