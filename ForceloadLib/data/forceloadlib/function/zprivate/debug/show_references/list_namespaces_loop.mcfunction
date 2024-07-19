# Tellraw
function forceloadlib:zprivate/debug/show_references/list_references

# Check next namespace
execute if score #ForceloadLib.NamespaceCount ForceloadLib matches 1 run return 0
scoreboard players remove #ForceloadLib.NamespaceCount ForceloadLib 1
data remove storage forceloadlib:temporary Namespaces[0]
function forceloadlib:zprivate/debug/show_references/list_namespaces_loop
