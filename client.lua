ESX = exports["es_extended"]:getSharedObject()

RegisterCommand("Createitem", function()
    local input = lib.inputDialog('Create Item Or Update', {
        {type = 'input', label = 'Item Name', description = 'Enter Item Name You Want To Create', required = true, min = 0, max = 100},
        {type = 'input', label = 'Item Label', description = 'Enter Item Label You Want To Create', required = true, min = 0, max = 100},
        {type = 'number', label = 'Weight', description = 'Enter Item Weight You Want To Create', icon = 'hashtag',required = true,},
        {type = 'checkbox', label = 'Delete item (If Delete Just Fill Inputs)'},
      })

 
    if not input then return end
    TriggerServerEvent("HikaBase:CreateItem",input[1],input[2],input[3],input[4]) 
end)
