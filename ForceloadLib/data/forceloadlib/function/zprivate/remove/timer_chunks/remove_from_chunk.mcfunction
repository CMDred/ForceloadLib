# Remove the reference from a chunk's data
$data remove storage forceloadlib:zprivate AllChunks[].References[{ID:$(ID)}]

# Unforceload if no references remain
$execute if data storage forceloadlib:zprivate {AllChunks:[{Dimension:"$(Dimension)",X:$(X),Z:$(Z),References:[]}]} run function forceloadlib:zprivate/remove/remove_forceload {Dimension:"$(Dimension)",X:$(X),Z:$(Z)}
