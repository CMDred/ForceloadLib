# Remove the reference from the "loading" list
scoreboard players remove #ForceloadLib.LoadingChunks ForceloadLib 1
execute if score #ForceloadLib.LoadingChunks ForceloadLib matches 0 run schedule clear forceloadlib:zprivate/add/loading_chunks/check_scheduled
$data remove storage forceloadlib:zprivate LoadingChunks[{ID:$(ID)}]
