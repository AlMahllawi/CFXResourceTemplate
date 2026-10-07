fx_version 'cerulean'
games { 'gta5' }
game 'gta5'
lua54 'yes'

author 'John Doe'
description 'Descriptive sentence.'
version '1.0.0'

-- Dependencies / requirements
dependency 'ox_lib'
dependencies {
    '/server:6116',
    '/onesync',
    'oxmysql',
}

-- Definition generation via AST
-- Singular file mapped to a custom output path (renamed and relocated)
generate_definition 'imports/vehicleData.lua' 'models/vehicleData.d.lua'

-- Array syntax for multiple files, bundled into a single definition file
generate_definitions {
    'imports/*.lua',
    'shared/definitions/**/*.lua',
    'server/classes/*.lua'
} 'coreFramework.d.lua'

-- Hand-written type definitions that should be directly copied without AST processing
copy_definitions {
    'stateBags.d.lua',
    'libs/**/*.d.lua'
}

-- Shared
shared_script '@ox_lib/init.lua'
shared_scripts {
    '@es_extended/imports.lua',
    'config.lua',
    'shared/*.lua',
}

-- Client
client_script 'client/main.lua'
client_scripts {
    'client/utils.lua',
    'client/modules/*.lua',
}

-- Server
server_script '@oxmysql/lib/MySQL.lua'
server_scripts {
    'server/main.lua',
    'server/callbacks.lua',
    'server/**/*.lua',
}

-- Exports (client)
export 'OpenShop'
exports {
    'IsShopOpen',
    'CloseShop',
}

-- Exports (server)
server_export 'GetShopStock'
server_exports {
    'AddShopStock',
    'RemoveShopStock',
}

-- NUI
ui_page 'web/build/index.html'

-- Files
file 'web/build/index.html'
files {
    'web/build/**/*',
    'locales/*.json',
    'data/handling.meta',
    'data/vehicles.meta',
    'data/carvariations.meta',
    'data/gta5.meta',
}

-- Meta / data files
data_file 'HANDLING_FILE'          'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE'  'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'DLC_ITYP_REQUEST'       'stream/shop_props.ytyp'

-- Loading screen (only one resource per server should set this)
loadscreen 'loading/index.html'
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'

-- Drop-in replacement for other resources
provide 'mysql-async'
provides {
    'ghmattimysql',
}

-- Custom metadata (read with GetResourceMetadata / GetNumResourceMetadata)
my_data 'abc' { field = true }
my_data('nine')({ field = true })

-- Map resources
this_is_a_map 'yes'
replace_level_meta 'gta5'          -- requires data/gta5.meta in files {}

-- Less common
disable_lazy_natives 'yes'
clr_disable_task_scheduler 'yes'
escrow_ignore {
    'config.lua',
    'shared/*.lua',
}

-- WARNING: server_only can't coexist with client_scripts, ui_page, or files.
-- Uncomment only in a pure server resource, after removing those.
-- server_only 'yes'