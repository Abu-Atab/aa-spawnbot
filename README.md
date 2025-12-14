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

## License

### Abu Atab DEV Team – Proprietary License

© 2025 Abu Atab DEV Team. All rights reserved.

This software is licensed, not sold.  
This script is the exclusive intellectual property of **Abu Atab DEV Team**.

### You are NOT allowed to:
- Sell, resell, rent, or monetize this script in any form
- Re-upload, redistribute, or mirror this resource
- Share this script publicly or privately outside your own server
- Include this script in any public or private pack or bundle
- Remove or modify any copyright, license, or author information
- Claim this script as your own work

### You ARE allowed to:
- Use this script on **one server only**
- Modify the script **for personal server use only**
- Create private edits that are not shared, sold, or redistributed

### Restrictions
- Commercial use, resale, or redistribution is strictly prohibited
  unless explicit written permission is granted by Abu Atab DEV Team.
- This license does not grant ownership of the source code.

### Enforcement
Any violation of this license may result in:
- Immediate revocation of usage rights
- DMCA takedown requests
- Legal action if necessary

By using this script, you acknowledge that you have read, understood,
and agreed to the terms of this license.
