fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Lykos'
description 'ox_target Debug'
version '1.0.0'

client_scripts {
    '@ox_lib/init.lua',
    'client_targetdebug.lua'
}

server_scripts {
    'server_targetdebug.lua'
}

dependencies {
    'ox_target',
    'ox_lib'
}

