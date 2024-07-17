# Save Storage Entry
$data modify storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}] set from storage forceloadlib:temporary RemoveChunk
data remove storage forceloadlib:temporary RemoveChunk
