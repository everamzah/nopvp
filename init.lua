minetest.register_node("nopvp:nopvp", {
	description = "No PvP Radial",
	tiles = {"default_obsidian.png^[colorize:white:36^heart.png"},
})

minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	if damage > 0 then
		local pos = player:getpos()
		if not pos then
			return false
		end
		local p1 = {x = pos.x - 5, y = pos.y - 5, z = pos.z - 5}
		local p2 = {x = pos.y + 5, y = pos.y + 5, z = pos.z + 5}
		if #minetest.find_nodes_in_area(p1, p2, {"nopvp:nopvp"}) > 0 then
			hitter:set_hp(hitter:get_hp() - damage)
			return true
		else
			return false
		end
	end
end)
