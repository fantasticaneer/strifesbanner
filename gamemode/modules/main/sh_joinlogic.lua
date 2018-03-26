local function tablesetup()
    if sql.TableExists("slot1_data") == true then
        return
        end
    sql.Query( "CREATE TABLE slot1_data( SteamID TEXT, CharID INTEGER )" )
    end
    hook.Add("Initialize", "tablesetups", tablesetup)
    
    descriptor = {"Lilly", "Bob", "Ashley", "Joe", "Rick"}
    
    local function spawned( ply )
    print( ply:GetName().." joined the game.\n" )
    print(sql.QueryValue("SELECT * from slot1_data" ))
    if sql.QueryValue("SELECT * from slot1_data" ) == ply:SteamID() then
        print( ply:GetName().." has a character already.\n" )
        return true
    else
        print ("Creating new CharID 0 for "..ply:SteamID().. "")
        sql.Query( "INSERT INTO slot1_data( SteamID, CharID ) VALUES( '"..ply:SteamID().."', 0 )" )
    end
    end
    hook.Add( "PlayerSpawn", "spawnlogic", spawned )