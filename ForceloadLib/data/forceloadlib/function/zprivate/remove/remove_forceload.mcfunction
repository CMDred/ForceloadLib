# Remove Forceload
$execute in $(Dimension) run forceload remove $(X) $(Z)

# Remove Storage Entry
$data remove storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}]
