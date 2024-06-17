# Put reference in "timer" list and do everything else regarding that
data modify storage forceloadlib:temporary AddChunk set from storage forceloadlib:temporary LoadingChunks[-1]
function forceloadlib:zprivate/add/timer_chunks/set_removal_timestamp
data remove storage forceloadlib:temporary AddChunk
