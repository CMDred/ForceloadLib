# Remove "Loading:1b" from the reference & replace "Duration" with "RemovalTimestamp" if it exists
$data modify storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].References[{ID:$(ID)}] set from storage forceloadlib:temporary AddReference
