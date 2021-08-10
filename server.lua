-- Function that gets the identifier. We need this to identify the player on the DB
GetIdentifier = function(source)
		for k,v in ipairs(GetPlayerIdentifiers(source)) do
			if string.match(v, 'license:') then
				local identifier = string.gsub(v, 'license:', '')
				return identifier
			end
   end
end

-- Function that retrieves the saved outfit

function GetCharSkin(source)
	local source = source
    local identifier = GetIdentifier(source)
    local appearance =  GetResourceKvpString(('users:%s:outfit_current'):format(identifier))
    local charappearance = json.decode(appearance)

	return charappearance
end

-- Event thats triggered to save the outfit

RegisterNetEvent('updatecharacterclothes')
AddEventHandler('updatecharacterclothes', function(appearance)
    local identifier = GetIdentifier(source)
        SetResourceKvp(('users:%s:outfit_current'):format(identifier), json.encode(appearance))
        print('outfit saved to db')
end)
