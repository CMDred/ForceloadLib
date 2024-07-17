# Copy the correct namespace to another data storage
execute store success score #ForceloadLib.WrongNamespace ForceloadLib run data modify storage forceloadlib:temporary RemoveChunk.Namespaces[-1].Namespace set from storage forceloadlib:util Remove.Namespace
execute if score #ForceloadLib.WrongNamespace ForceloadLib matches 0 run data modify storage forceloadlib:temporary RemoveChunk.Namespace set from storage forceloadlib:temporary RemoveChunk.Namespaces[-1].Namespace
execute if score #ForceloadLib.WrongNamespace ForceloadLib matches 0 run return run data modify storage forceloadlib:temporary RemoveChunk.References set from storage forceloadlib:temporary RemoveChunk.Namespaces[-1].References
execute if score #ForceloadLib.NamespaceCount ForceloadLib matches 1 run return 0

# Check next namespace
scoreboard players remove #ForceloadLib.NamespaceCount ForceloadLib 1
data remove storage forceloadlib:temporary RemoveChunk.Namespaces[-1]
function forceloadlib:zprivate/remove/remove_last/filter_namespace
