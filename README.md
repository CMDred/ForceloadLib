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
  - `Command`: Run a command at the specified location
  - `CommandTrigger`: Specify when the command runs
    - Instantly (or as soon as the chunk loads)
    - Only if the chunk loads
  - `Force`: Make the reference unremovable until the chunk is loaded
  - `Protected`: Make the reference unremovable unless you target it directly via ID
  - `Duration`: Make the reference disappear after an arbitrary number of ticks
- Powerful reference management
  - Either remove the last removable reference from a chunk, or target it directly via ID
- Chunk loading management. When a chunk gets loaded:
  - `#ForceloadLib.ChunkLoaded ForceloadLib` score gets set to the reference's ID
  - `forceloadlib:event ChunkLoaded` storage gets set with the `Dimension`, `X` and `Z` data of the chunk
  - `#forceloadlib:chunk_loaded` function tag gets called with that storage as a macro source
- A function tag that's called whenever a chunk gets loaded
  - It also sets a score (Reference ID) & a storage (Dimension & X/Z coords) for 
- Compatibility with Vanilla forceloaded chunks
  - These chunks will be ignored when trying to add/remove references

## How to use
Follow the instructions in the respective function (Everything except `zprivate`):
- Add forceload references:
  - `forceloadlib:util/add/from_storage`
  - `forceloadlib:util/add/from_storage_and_position` **=>** 1 macro call less than `from_storage`, but must be executed inside the correct chunk
- Remove forceload references:
  - `forceloadlib:util/remove/from_storage`
  - `forceloadlib:util/remove/from_storage_and_position` **=>** 1 macro call less than `from_storage`, but must be executed inside the correct chunk
  - `forceloadlib:util/remove/with_id`
  - `forceloadlib:util/remove/with_id_from_position` **=>** 1 macro call less than `with_id`, but must be executed inside the correct chunk
- Update ForceloadLib:
  - Run `forceloadlib:uninstall`
  - Remove the datapack and replace it with the new version
  - Reload
- Uninstall ForceloadLib:
  - Run `forceloadlib:uninstall` and click the red `CLICK HERE` message to clear all remaining chunk data
  - Remove the datapack
 
**Note:** ForceloadLib provides a free-to-use scoreboard objective called `ForceloadLib.ChunkID`

## Credit
From CMDred:
- **SilicatYT**

## License
As per the MIT License, you are allowed to redistribute, modify and use this project as long as we are credited for the original work.
