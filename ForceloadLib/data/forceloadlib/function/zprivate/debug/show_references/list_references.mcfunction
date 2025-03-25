# Copy the namespace's references into a temporary storage
tellraw @s ["",{text:"Namespace: ",color:"gold"},{"nbt":"Namespaces[0].Namespace","storage":"forceloadlib:temporary"}]
data modify storage forceloadlib:temporary References set from storage forceloadlib:temporary Namespaces[0].References

# Loop through the references of that namespace and tellraw each one
execute store result score #ForceloadLib.ReferenceCount ForceloadLib if data storage forceloadlib:temporary References[]
function forceloadlib:zprivate/debug/show_references/list_references_loop
data remove storage forceloadlib:temporary References
