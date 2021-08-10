-- Function that loads the saved outfit. You should probably trigger this event
-- from the playerSpawned event handler

RegisterNetEvent('player:loadcharacterclothes')
AddEventHandler('player:loadcharacterclothes', function(source, charappearance)
  print('and here')
  local appearance = charappearance
  exports["fivem-appearance"]:setPlayerAppearance(appearance)
  print('Loaded clothes')
end)

-- Command provided with default resource but with a server event trigger to 
-- save the outfit to the kvs database

RegisterCommand('skin', function()
    local config = {
      ped = true,
      headBlend = true,
      faceFeatures = true,
      headOverlays = true,
      components = true,
      props = true,
    }

    local source = source
    local playerid = GetPlayerFromServerId(source)
    exports['fivem-appearance']:startPlayerCustomization(function (appearance)
        if (appearance) then
        print('Saved')        
        TriggerServerEvent('updatecharacterclothes', appearance)
        else
        print('Canceled')
        end
    end, config)
  end, false)
