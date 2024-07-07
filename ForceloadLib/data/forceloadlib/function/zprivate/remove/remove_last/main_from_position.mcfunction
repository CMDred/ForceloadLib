# THIS FUNCTION IS IDENTICAL TO "main", WITH THE EXCEPTION THAT IT'S ALREADY RUN IN THE CORRECT CHUNK AND NEEDS A MACRO LESS

# Load the chunk's references
$data modify storage forceloadlib:temporary RemoveChunk.References set from storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].References

# Stop if the chunk has no references
execute unless data storage forceloadlib:temporary RemoveChunk.References run return 0

# Modify the chunk's references: Remove the last removable reference (Not Forced & Loading, not Protected)
execute store result score #ForceloadLib.ListSize ForceloadLib if data storage forceloadlib:temporary RemoveChunk.References[]
function forceloadlib:zprivate/remove/remove_last/check_loop
data modify storage forceloadlib:temporary RemoveChunk.References append from storage forceloadlib:temporary UnremovableReferences[]
data remove storage forceloadlib:temporary UnremovableReferences
data remove storage forceloadlib:temporary CurrentReference

# Save the chunk's references
$data modify storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].References set from storage forceloadlib:temporary RemoveChunk.References

# Unforceload if no references remain
execute if data storage forceloadlib:temporary {RemoveChunk:{References:[]}} run function forceloadlib:zprivate/remove/remove_forceload_from_position with storage forceloadlib:temporary RemoveChunk
