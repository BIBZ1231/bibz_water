-- resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


fx_version 'adamant'
games { 'gta5' }

-- dependencies {
--    "drp_id",
--    "drp_notifications",
--    "drp_bank"
-- }

shared_script "shared.lua"
shared_script "config.lua"

client_script "client.lua"

server_script "server.lua"