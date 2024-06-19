# Check if reference is removable
data modify storage forceloadlib:temporary CurrentReference set from storage forceloadlib:temporary RemoveChunk.References[-1]
execute unless data storage forceloadlib:temporary CurrentReference.Protected unless data storage forceloadlib:temporary {CurrentReference:{Loading:1b,Force:1b}} run return run function forceloadlib:zprivate/remove/remove_last/remove_reference

# Reference is not removable, go to next
execute if score #ForceloadLib.ListSize ForceloadLib matches 1 run return 0
data remove storage forceloadlib:temporary RemoveChunk.References[-1]
data modify storage forceloadlib:temporary UnremovableReferences prepend from storage forceloadlib:temporary CurrentReference
function forceloadlib:zprivate/remove/remove_last/check_loop
