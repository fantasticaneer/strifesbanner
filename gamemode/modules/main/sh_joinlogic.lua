local function tablesetup()
    if sql.TableExists("slot1_data") == true then
        return
        end
    sql.Query( "CREATE TABLE slot1_data( SteamID TEXT, CharName TEXT )" )
    end
    hook.Add("Initialize", "tablesetups", tablesetup)
    
    randomnames = {"Lilly", "Bob", "Ashley", "Joe", "Rick"}
    
    local function spawned( ply )
    print( ply:GetName().." joined the game.\n" )
    print(sql.QueryValue("SELECT CharName FROM slot1_data WHERE SteamID = '"..ply:SteamID().."'" ))
    if sql.QueryValue("SELECT CharName FROM slot1_data WHERE SteamID = '"..ply:SteamID().."'" ) == "testo" then
        print( ply:GetName().." has a character already.\n" )
        print ("Character name is " ..sql.QueryValue("SELECT CharName FROM slot1_data WHERE SteamID = '"..ply:SteamID().."'" ))
        return true
    else
        print ("Creating new CharName for "..ply:SteamID().. "")
        sql.Query( "INSERT INTO slot1_data( SteamID, CharName ) VALUES( '"..ply:SteamID().."', 'testo')") 
    end
    end
    hook.Add( "PlayerSpawn", "spawnlogic", spawned )