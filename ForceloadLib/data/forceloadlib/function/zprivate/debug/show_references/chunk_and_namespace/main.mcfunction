# Copy the namespace into a temporary storage
$data modify storage forceloadlib:temporary Namespaces append from storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].Namespaces[{Namespace:"$(Namespace)"}]
execute unless data storage forceloadlib:temporary Namespaces run return run tellraw @s "[No namespaces found]"

# Loop through the references of that namespace and tellraw each one
function forceloadlib:zprivate/debug/show_references/list_references
data remove storage forceloadlib:temporary Namespaces
