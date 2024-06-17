# Remove "Loading:1b" from the reference
$data remove storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].References[{ID:$(ID)}].Loading
