# Save the temporary storage back to the chunk's storage
$data modify storage forceloadlib:zprivate AllChunks[{References:[{ID:$(ID)}]}] set from storage forceloadlib:temporary RemoveChunk
