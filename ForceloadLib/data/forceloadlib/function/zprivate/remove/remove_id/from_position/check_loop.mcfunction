# Compare the Reference ID
data modify storage forceloadlib:temporary CurrentReference set from storage forceloadlib:temporary RemoveChunk.References[-1]
execute store success score #ForceloadLib.NoMatchingID ForceloadLib run data modify storage forceloadlib:temporary CurrentReference.ID set from storage forceloadlib:util RemoveChunk.ID

# Match found: Remove the reference with the ID (Unless it's loading and forced)
execute if score #ForceloadLib.NoMatchingID ForceloadLib matches 0 run return run function forceloadlib:zprivate/remove/remove_id/from_position/remove with storage forceloadlib:temporary RemoveChunk.References[-1]

# No match found: Check next element
execute if score #ForceloadLib.ListSize ForceloadLib matches 1 run return 0
scoreboard players remove #ForceloadLib.ListSize ForceloadLib 1
data modify storage forceloadlib:temporary UnremovableReferences prepend from storage forceloadlib:temporary RemoveChunk.References[-1]
data remove storage forceloadlib:temporary RemoveChunk.References[-1]
function forceloadlib:zprivate/remove/remove_id/from_position/check_loop
