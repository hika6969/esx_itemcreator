ESX = exports["es_extended"]:getSharedObject()

admins = {
	'license:3fd53b244c40865e88fb4d84adfbb1341dd5f6bb', --hika
}



function isWhitelisted(player)
	local whitelisted = false
	for i, id in ipairs(admins) do
		for x, pid in ipairs(GetPlayerIdentifiers(player)) do
			if string.lower(pid) == string.lower(id) then
				whitelisted = true
			end
		end
	end
	return whitelisted
end

RegisterNetEvent('HikaBase:CreateItem')
AddEventHandler('HikaBase:CreateItem', function(itemname, itemlabel, itemweight,deletestatus)
	local xPlayer = ESX.GetPlayerFromId(source)
	if isWhitelisted(source) then
		if deletestatus then
			MySQL.insert(
				'DELETE FROM items WHERE name=?;', {
					itemname,
				}, function(id)
					
				end)
				TriggerClientEvent('esx:showNotification', source,
					'Done Deleted '..itemname)
		else
				MySQL.insert(
			'INSERT INTO `items` (name, label, weight) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE label = ?, weight = ?', {
				itemname, itemlabel, itemweight, itemlabel, itemweight,
			}, function(id)

			end)
		TriggerClientEvent('esx:showNotification', source,
			'Done Created : ' .. itemname .. ' With Label : ' .. itemlabel .. ' With Weight : ' .. itemweight)
		end
	else
		TriggerClientEvent('esx:showNotification', source, 'You dont have perms')
	end
end)