# Save the storage entry
$data modify storage forceloadlib:zprivate AllChunks[{Dimension:"$(Dimension)",X:$(X),Z:$(Z)}].Namespaces[{Namespace:"$(Namespace)"}].References set from storage forceloadlib:temporary RemoveChunk.References
