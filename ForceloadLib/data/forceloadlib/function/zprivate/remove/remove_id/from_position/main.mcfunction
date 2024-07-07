# Remove the reference with the ID (Unless it's loading and forced)
execute store result score #ForceloadLib.ListSize ForceloadLib if data storage forceloadlib:temporary RemoveChunk.References[]
function forceloadlib:zprivate/remove/remove_id/from_position/check_loop
data remove storage forceloadlib:temporary UnremovableReferences
data remove storage forceloadlib:temporary CurrentReference
