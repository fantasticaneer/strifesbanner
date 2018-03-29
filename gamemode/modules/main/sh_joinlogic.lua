
fmodels = {"models/player/Group01/female_03.mdl", "models/player/Group01/female_06.mdl"}
mmodels = {"models/player/Group01/male_01.mdl", "models/player/Group01/male_04.mdl"}
ffirstnames = {"Anna", "Charlotte", "Eleanor", "Ella", "Eva", "Grace", "Julia", "Lucy", "Rose", "Stella", "Violet", "Lena", "Alice", "Beatrice", "Clara", "Edith", "Esther", "Evelyn", "Hazel", "Florence", "Josephine", "June", "Mabel", "Vera", "Viola", "Sylvia", "Ruby", "Agnes", "Alma", "Bessie", "Betty", "Blanche", "Dorothy", "Elsie", "Genevieve", "Helen"}
mfirstnames = {"Andrew", "Benjamin", "Charles", "Harry", "Henry", "Jack", "Leo", "Ray", "Sam", "William", "Arthur", "Edward", "Frank", "Homer", "Leon", "Louis", "Lewis", "Oscar", "Raymond", "Victor", "Vincent", "Walter"}
lastnames = {"Taylor", "Smith", "Moore", "Baker", "Walker", "Hall", "Turner", "Collins", "Jackson", "Carter", "Abrahams", "Abrahamson", "Ackerman", "Addison", "Atwater", "Atwood", "Ayers", "Ashworth", "Bonney", "Booth", "Colbert", "Collingwood", "Cockburn", "Cookson", "Derrick", "Debenham", "Davidson", "Eccleston", "Dyer", "Dwerryhouse", "Garfield", "Hamilton", "Hampson", "Hawking", "Hayward", "Huxley", "Irvine", "Jackson", "Hyland", "Lamar", "Layton", "Kitchens", "Kinsley", "Norman", "Norris", "Saunders", "Scrivenor", "Sherman", "Simms", "Spurling", "Southers", "Southgate", "Snyders", "Stern", "Warren", "Watson", "Watts", "Weaver", "Webb", "Ware", "Warrick", "Waterman", "York", "Morgan", "Young", "Wright"}
sexes = {"Male", "Female"}


function generatechar(ply)
    ply:SetNWString("sex", sexes[ math.random ( #sexes )])

    -- if female
    if ply:GetNWString("sex") == "Female" then
        ply:SetNWString("model", fmodels[ math.random( #fmodels ) ] )
        ply:SetNWString( "firstname", ffirstnames[ math.random( #ffirstnames ) ])
        ply:SetNWString( "lastname", lastnames[ math.random( #lastnames ) ])

    else if ply:GetNWString("sex") == "Male" then 
        -- if male
        ply:SetNWString("model", mmodels[ math.random( #mmodels ) ] )
        ply:SetNWString( "firstname", mfirstnames[ math.random( #mfirstnames ) ])
        ply:SetNWString( "lastname", lastnames[ math.random( #lastnames ) ])
        end
    end
print(ply:GetNWString("sex") .. " " .. ply:GetNWString("model") .. " " .. ply:GetNWString("firstname") .. " " .. ply:GetNWString("lastname"))  
end

local function tablesetup()
    if sql.TableExists("slot1_data") == true then
        return
        end
    sql.Query( "CREATE TABLE slot1_data( SteamID TEXT, CharName TEXT )" )
    end
    hook.Add("Initialize", "tablesetups", tablesetup)
    
    local function spawned( ply )
    
    print( ply:GetName().." joined the game.\n" )
    generatechar(ply)
    print(sql.QueryValue("SELECT CharName FROM slot1_data WHERE SteamID = '"..ply:SteamID().."'" ))
    if sql.QueryValue("SELECT CharName FROM slot1_data WHERE SteamID = '"..ply:SteamID().."'" ) == "testo" then
        print( ply:GetName().." has a character already.\n" )
        print ("Character name is " ..sql.QueryValue("SELECT CharName FROM slot1_data WHERE SteamID = '"..ply:SteamID().."'" ))
        ply:SetModel( "models/player/kleiner.mdl" )
        ply:Give("weapon_sbhands")
        ply:ConCommand("newcharframe")
        return true
    else
        print ("Creating new CharName for "..ply:SteamID().. "")
        sql.Query( "INSERT INTO slot1_data( SteamID, CharName ) VALUES( '"..ply:SteamID().."', 'testo')") 
        ply:ConCommand("newcharframe")
    end 
end    
hook.Add( "PlayerSpawn", "spawnlogic", spawned )