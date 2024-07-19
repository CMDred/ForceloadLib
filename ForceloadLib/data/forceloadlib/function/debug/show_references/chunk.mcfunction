############################################################################################################
##                                               HOW TO USE                                               ##
############################################################################################################
## 1. Run this function with the macro variables {Dimension:'...',Pos[X,Y,Z]}                             ##
## 2. All the references of that chunk will be listed in your chat                                        ##
##                                                                                                        ##
## Note: Always include the dimension's namespace                                                         ##
############################################################################################################

# Split the Pos into X and Z for macro usage and align to the chunk origin
$data modify storage forceloadlib:temporary Chunk.Dimension set value "$(Dimension)"
$data modify storage forceloadlib:temporary Chunk.Pos set value $(Pos)
execute store result storage forceloadlib:temporary Chunk.X int 16 run data get storage forceloadlib:temporary Chunk.Pos[0] 0.0625
execute store result storage forceloadlib:temporary Chunk.Z int 16 run data get storage forceloadlib:temporary Chunk.Pos[2] 0.0625

tellraw @s ["",{"text":"□ ForceloadLib >> ","color":"#51B54F"},"List of references:"]
function forceloadlib:zprivate/debug/show_references/chunk/main with storage forceloadlib:temporary Chunk
data remove storage forceloadlib:temporary Chunk