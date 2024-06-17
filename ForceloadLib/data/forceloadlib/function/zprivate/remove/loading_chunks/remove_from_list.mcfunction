# Remove the reference from the "loading" list
scoreboard players remove #ForceloadLib.LoadingChunks ForceloadLib 1
$data remove storage forceloadlib:zprivate LoadingChunks[{ID:$(ID)}]
