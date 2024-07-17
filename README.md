# ForceloadLib
A Minecraft Data Pack library that adds various useful features related to forceloading chunks.\
Download: [Modrinth](https://modrinth.com/datapack/forceloadlib)\
For inquiries, please contact **@silicatYT** on Discord.

## Why you need ForceloadLib
If your DataPack uses forceloaded chunks, it's inherently incompatible with any other DataPack which does too. The same is the case for multiple systems within the same DataPack which use forceloads.\
\
ForceloadLib solves this by not only providing a **reference-based approach**, but also by **namespacing** the references. This allows your systems or DataPacks to independently forceload chunks without interfering with one another.\
ForceloadLib also offers many useful features aside from that.\
\
**Note:** While ForceloadLib strives for cross-pack compatibility, DataPacks that don't use it will still be incompatible.

## Features
- Reference-based forceloading
  - Add and remove forceload references from a chunk
  - The chunk will only stop being forceloaded once every single reference has been removed
  - Each reference belongs to a namespace for better control & cross-system compatibility
- Various optional parameters for your forceload references:
  - **Command:** Run a command at the specified location as soon as the chunk is loaded
  - **Force:** Make the reference unremovable until the chunk is loaded
  - **Protected:** Make the reference unremovable unless you target it directly via ID
  - **Duration:** Make the reference disappear after an arbitrary number of ticks
- Powerful reference management
  - Either remove the last removable reference from a chunk, or target it directly via ID
- Chunk loading management. When a chunk gets loaded:
  - '#ForceloadLib.ChunkLoaded ForceloadLib' score gets set to the reference's ID
  - 'forceloadlib:event ChunkLoaded' storage gets set with the 'Dimension', 'X' and 'Z' data of the chunk
  - '#forceloadlib:chunk_loaded' function tag gets called with that storage as a macro source
- A function tag that's called whenever a chunk gets loaded
  - It also sets a score (Reference ID) & a storage (Dimension & X/Z coords) for 
- Compatibility with Vanilla forceloaded chunks
  - These chunks will be ignored when trying to add/remove references

## How to use
(For now, it's explained inside each function within 'forceloadlib:util/...')

## Credit
From CMDred:
- **SilicatYT**

## License
As per the MIT License, you are allowed to redistribute, modify and use TimeLib as long as we are credited for the original work.
