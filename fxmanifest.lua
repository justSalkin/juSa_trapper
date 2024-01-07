fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'justSalkin'
description 'Script for a traveling trapper'
version '1.2'

client_script {
    '/client/warmenu.lua',
    '/client/client.lua',
    '/client/npc_handler.lua',
}

server_script {
    'server.lua', 
}

shared_scripts {
    'config.lua',
}

dependency 'vorp_core'
dependencies {
    'vorp_core',
    'vorp_inventory',
}