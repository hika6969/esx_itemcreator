fx_version 'cerulean'
game 'gta5'

name "esx_itemcreator"
description "Basic item manager"
author "Hika"
version "1.0"

shared_scripts {
	'@ox_lib/init.lua',
}

client_scripts {
	'client.lua',
}

server_scripts {
	'server.lua',
	'@oxmysql/lib/MySQL.lua',
}
dependencies {
	'ox_lib',
}
lua54 'yes'
