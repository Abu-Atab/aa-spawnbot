# aa-spawnbot Script (Standalone)

This script allows you to spawn NPC bots with your exact outfit + a chosen emote.  
All bots are saved in `config.lua` and automatically respawn when the resource restarts.

## Features
- **Standalone** (does not require any external framework or exports).
- **Persistent bots** saved in `config.lua`.
- **Full appearance support**: clothing, props, hair color, and eye color.
- **Debug mode** to display each bot's ID above their head.
- **Ultra low performance usage** (both client & server).

## Commands
- `/spawnmybot` → Spawns a new bot with your outfit and a chosen emote.
- `/deletebot` → Deletes the closest bot to you and removes it from `config.lua`.
- `/botdebug on` → Enables debug mode (shows Bot IDs above their heads).
- `/botdebug off` → Disables debug mode.

## Files
- **client.lua** → Handles bot spawning on the client.
- **server.lua** → Handles saving/removing bots from the config.
- **config.lua** → Stores bot data (updated automatically).

## Performance
- **0.00ms** idle usage.
- With `/botdebug on`, a lightweight draw loop runs, using **<0.01ms**.

## Notes
- Bots are frozen, invincible, and perform the emote continuously.
- Each bot gets a unique ID, making it easy to manage or delete.
- The resource updates `config.lua` automatically when adding/removing bots.
