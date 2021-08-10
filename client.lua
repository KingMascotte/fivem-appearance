-- Function that loads the saved outfit. You should probably trigger this event
-- from the playerSpawned event handler

RegisterNetEvent('player:loadcharacterclothes')
AddEventHandler('player:loadcharacterclothes', function(source, charappearance)
  print('and here')
  local appearance = charappearance
  exports["fivem-appearance"]:setPlayerAppearance(appearance)
  print('Loaded clothes')
end)
