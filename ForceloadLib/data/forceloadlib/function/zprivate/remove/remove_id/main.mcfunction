# Remove the reference with the ID (Unless it's loading and forced)
$data modify storage forceloadlib:temporary RemoveChunk set from storage forceloadlib:zprivate AllChunks[{References:[{ID:$(ID)}]}]
execute unless data storage forceloadlib:temporary RemoveChunk run return 0
execute store result score #ForceloadLib.ListSize ForceloadLib if data storage forceloadlib:temporary RemoveChunk.References[]
function forceloadlib:zprivate/remove/remove_id/check_loop
data remove storage forceloadlib:temporary UnremovableReferences
data remove storage forceloadlib:temporary CurrentReference
