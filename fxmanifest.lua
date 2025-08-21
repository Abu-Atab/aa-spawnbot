fx_version 'cerulean'
description 'Spawn a bot by command, and copy your clothes as him, Made By : @adn9o'
author 'Abu Atab '
version '1.0.0'
lua54 'yes'
game 'gta5'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'
escrow_ignore 'config.lua'

shared_script '@ox_lib/init.lua'

ox_libs {
    'locale',
    'math',
    'table',
}