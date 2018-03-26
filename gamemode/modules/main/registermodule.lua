-- Define module information
-- All module data must be set correctly, skipping keys will result in a error
-- Module data is in JSON format

-- Must be set (case sensitive)
-- If 'folderName' is not set, Liro will completely fail to load!
local folderName = "main"
local moduleData = '{  "folderName": "' .. folderName .. '", "loadPriority": 5, "author": "Fantastic", "description": "Testing module for Police State","website": "police-state.tumblr.com","version": "0.1","networkStrings": ["networkString1","networkString2"],"loadPrefixes": {"server": "sv_","client": "cl_","shared": "sh_"}}'
-- "networkStrings": ["networkString1","networkString2"]

-- Register the module - Do not touch
hook.Run("liro.registerModule", moduleData)