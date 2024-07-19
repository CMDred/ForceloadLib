# Copy the namespaces into a temporary storage
$data modify storage forceloadlib:temporary Namespaces set from storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].Namespaces
execute unless data storage forceloadlib:temporary Namespaces run return run tellraw @s "[No namespaces found]"

# Loop through the references of that namespace and tellraw each one
execute store result score #ForceloadLib.NamespaceCount ForceloadLib if data storage forceloadlib:temporary Namespaces[]
function forceloadlib:zprivate/debug/show_references/list_namespaces_loop
data remove storage forceloadlib:temporary Namespaces
