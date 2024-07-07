# Remove Forceload
forceload remove ~ ~

# Remove Storage Entry
$data remove storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}]
