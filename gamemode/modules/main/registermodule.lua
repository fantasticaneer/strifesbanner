-- Define module information
-- All module data must be set correctly, skipping keys will result in a error
-- Module data is in JSON format

-- Please also note; for linux users module(s) and/or uppercase file name paths will cause issues, same with spaces/tabs.

-- Must be set (case sensitive)
-- If 'folderName' is not set, Liro will completely fail to load!
local folderName = "main"
local moduleData = '{"folderName": "' .. folderName .. '", "loadPriority": 5,"author": "Fantastic","description": "Strifes Banner","website": "tumblr","version": "0.1", "blacklistedFiles": ["sv_testfile.lua"], "networkStrings": ["opencgen"], "loadPrefixes": {"server": "sv_", "client": "cl_", "shared": "sh_"}}'

-- Register the module - Do not touch
hook.Run("liro.registerModule", moduleData)
