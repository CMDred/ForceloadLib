# Run the command
$$(Command)

# Clean up the temporary storage and return the ID
data remove storage forceloadlib:temporary AddChunk
return run scoreboard players get #ForceloadLib.ReferenceID ForceloadLib
