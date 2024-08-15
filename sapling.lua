
local S = ethereal.translate

-- Sapling protection check function
local sapling_protection_check = minetest.settings:get_bool(
		"ethereal.sapling_protection_check", false)

local function prepare_on_place(itemstack, placer, pointed_thing, name, w, h)

	if sapling_protection_check then

		-- check if grown tree area intersects any players protected area
		return default.sapling_on_place(itemstack, placer, pointed_thing,
			name, {x = -w, y = 1, z = -w}, {x = w, y = h, z = w}, 4)
	end

	-- Position of sapling
	local pos = pointed_thing.under
	local node = minetest.get_node_or_nil(pos)
	local pdef = node and minetest.registered_nodes[node.name]

	-- Check if node clicked on has it's own on_rightclick function
	if pdef and pdef.on_rightclick
	and not (placer and placer:is_player()
	and placer:get_player_control().sneak) then
		return pdef.on_rightclick(pos, node, placer, itemstack, pointed_thing)
	end

	-- place normally
	return minetest.item_place_node(itemstack, placer, pointed_thing)
end


-- Basandra Bush Sapling
minetest.register_node("ethereal:basandra_bush_sapling", {
	description = S("Basandra Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"ethereal_basandra_bush_sapling.png"},
	inventory_image = "ethereal_basandra_bush_sapling.png",
	wield_image = "ethereal_basandra_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, attached_node = 1, ethereal_sapling = 1,
			sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	grown_height = 2,
	on_place = function(itemstack, placer, pointed_thing)
		return prepare_on_place(itemstack, placer, pointed_thing,
				"ethereal:basandra_bush_sapling", 1, 2)
	end
})


-- Bamboo Sprout
minetest.register_node("ethereal:bamboo_sprout", {
	description = S("Bamboo Sprout"),
	drawtype = "plantlike",
	tiles = {"ethereal_bamboo_sprout.png"},
	inventory_image = "ethereal_bamboo_sprout.png",
	wield_image = "ethereal_bamboo_sprout.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {
		food_bamboo_sprout = 1, snappy = 3, attached_node = 1, flammable = 2,
		dig_immediate = 3, ethereal_sapling = 1, sapling = 1,
	},
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 0, 4 / 16}
	},
	on_use = minetest.item_eat(2),
	grown_height = 11,
	on_place = function(itemstack, placer, pointed_thing)
		return prepare_on_place(itemstack, placer, pointed_thing,
				"ethereal:bamboo_sprout", 1, 18)
	end
})


-- Register Saplings
local register_sapling = function(name, desc, texture, width, height)

	minetest.register_node(name .. "_sapling", {
		description = S(desc .. " Tree Sapling"),
		drawtype = "plantlike",
		tiles = {texture .. ".png"},
		inventory_image = texture .. ".png",
		wield_image = texture .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {
			snappy = 2, dig_immediate = 3, flammable = 2,
			ethereal_sapling = 1, attached_node = 1, sapling = 1
		},
		sounds = default.node_sound_leaves_defaults(),
		grown_height = height,
		on_place = function(itemstack, placer, pointed_thing)
			return prepare_on_place(itemstack, placer, pointed_thing,
					name .. "_sapling", width, height)
		end
	})
end

register_sapling("ethereal:willow", "Willow", "ethereal_willow_sapling", 5, 14)
register_sapling("ethereal:yellow_tree", "Healing", "ethereal_yellow_tree_sapling", 4, 19)
register_sapling("ethereal:big_tree", "Big", "ethereal_big_tree_sapling", 4, 7)
register_sapling("ethereal:banana_tree", "Banana", "ethereal_banana_tree_sapling", 3, 8)
register_sapling("ethereal:frost_tree", "Frost", "ethereal_frost_tree_sapling", 4, 19)
register_sapling("ethereal:mushroom", "Mushroom", "ethereal_mushroom_sapling", 4, 11)
register_sapling("ethereal:mushroom_brown", "Brown Mushroom", "ethereal_mushroom_brown_sapling", 1, 11)
register_sapling("ethereal:palm", "Palm", "moretrees_palm_sapling", 4, 9)
register_sapling("ethereal:giant_redwood", "Giant Redwood",
		"ethereal_giant_redwood_sapling", 7, 33)
register_sapling("ethereal:redwood", "Redwood", "ethereal_redwood_sapling", 4, 21)
register_sapling("ethereal:orange_tree", "Orange", "ethereal_orange_tree_sapling", 2, 6)
register_sapling("ethereal:birch", "Birch", "moretrees_birch_sapling", 2, 7)
register_sapling("ethereal:sakura", "Sakura", "ethereal_sakura_sapling", 4, 10)
register_sapling("ethereal:lemon_tree", "Lemon", "ethereal_lemon_tree_sapling", 2, 7)
register_sapling("ethereal:olive_tree", "Olive", "ethereal_olive_tree_sapling", 3, 10)


local add_tree = function (pos, ofx, ofy, ofz, schem, replace)

	-- check for schematic
	if not schem then
		print (S("Schematic not found"))
		return
	end

	-- remove sapling and place schematic
	minetest.swap_node(pos, {name = "air"})

	minetest.place_schematic({x = pos.x - ofx, y = pos.y - ofy, z = pos.z - ofz},
			schem, 0, replace, false)
end


local path = minetest.get_modpath("ethereal") .. "/schematics/"

-- grow tree functions

function ethereal.grow_basandra_bush(pos)
	add_tree(pos, 1, 0, 1, ethereal.basandrabush)
end

function ethereal.grow_yellow_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.yellowtree)
end

function ethereal.grow_big_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.bigtree)
end

function ethereal.grow_banana_tree(pos)

	if math.random(2) == 1 and minetest.find_node_near(pos, 1, {"farming:soil_wet"}) then

		add_tree(pos, 3, 0, 3, ethereal.bananatree,
				{{"ethereal:banana", "ethereal:banana_bunch"}})
	else
		add_tree(pos, 3, 0, 3, ethereal.bananatree)
	end
end

function ethereal.grow_frost_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.frosttrees)
end

function ethereal.grow_mushroom_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.mushroomone)
end

function ethereal.grow_mushroom_brown_tree(pos)
	add_tree(pos, 1, 0, 1, ethereal.mushroomtwo)
end

function ethereal.grow_palm_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.palmtree)
end

function ethereal.grow_willow_tree(pos)
	add_tree(pos, 5, 0, 5, ethereal.willow)
end

function ethereal.grow_redwood_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.redwood_small_tree)
end

function ethereal.grow_giant_redwood_tree(pos)
	add_tree(pos, 7, 0, 7, ethereal.redwood_tree)
end

function ethereal.grow_orange_tree(pos)
	add_tree(pos, 2, 0, 2, ethereal.orangetree)
end

function ethereal.grow_bamboo_tree(pos)
	add_tree(pos, 1, 0, 1, ethereal.bambootree)
end

function ethereal.grow_birch_tree(pos)
	add_tree(pos, 2, 0, 2, ethereal.birchtree)
end

function ethereal.grow_sakura_tree(pos)

	if math.random(10) == 1 then

		add_tree(pos, 4, 0, 3, ethereal.sakura_tree,
				{{"ethereal:sakura_leaves", "ethereal:sakura_leaves2"}})
	else
		add_tree(pos, 4, 0, 3, ethereal.sakura_tree)
	end
end

function ethereal.grow_lemon_tree(pos)
	add_tree(pos, 2, 0, 2, ethereal.lemontree)
end

function ethereal.grow_olive_tree(pos)
	add_tree(pos, 3, 0, 3, ethereal.olivetree)
end


-- check if sapling has enough height room to grow
local enough_height = function(pos, height)

	local nod = minetest.line_of_sight(
		{x = pos.x, y = pos.y + 1, z = pos.z},
		{x = pos.x, y = pos.y + height, z = pos.z})

	if not nod then
		return false -- obstructed
	else
		return true -- can grow
	end
end

local saplings_map = {
	-- sapling name -> expected under, grow function
	-- expected_under == true: any soil
	["ethereal:basandra_bush_sapling"] = {
		"ethereal:fiery_dirt", ethereal.grow_basandra_bush
	},
	["ethereal:yellow_tree_sapling"] = {
		true, ethereal.grow_yellow_tree
	},
	["ethereal:big_tree_sapling"] = {
		"default:dirt_with_grass", ethereal.grow_big_tree
	},
	["ethereal:banana_tree_sapling"] = {
		"ethereal:grove_dirt", ethereal.grow_banana_tree
	},
	["ethereal:frost_tree_sapling"] = {
		"ethereal:crystal_dirt", ethereal.grow_frost_tree
	},
	["ethereal:mushroom_sapling"] = {
		"ethereal:mushroom_dirt", ethereal.grow_mushroom_tree
	},
	["ethereal:mushroom_brown_sapling"] = {
		"ethereal:mushroom_dirt", ethereal.grow_mushroom_brown_tree
	},
	["ethereal:palm_sapling"] = {
		"default:sand", ethereal.grow_palm_tree
	},
	["ethereal:willow_sapling"] = {
		"ethereal:gray_dirt", ethereal.grow_willow_tree
	},
	["ethereal:redwood_sapling"] = {
		"default:dirt_with_dry_grass", ethereal.grow_redwood_tree
	},
	["ethereal:giant_redwood_sapling"] = {
		"default:dirt_with_dry_grass", ethereal.grow_giant_redwood_tree
	},
	["ethereal:orange_tree_sapling"] = {
		"ethereal:prairie_dirt", ethereal.grow_orange_tree
	},
	["ethereal:bamboo_sprout"] = {
		"ethereal:bamboo_dirt", ethereal.grow_bamboo_tree
	},
	["ethereal:birch_sapling"] = {
		"default:dirt_with_grass", ethereal.grow_birch_tree
	},
	["ethereal:sakura_sapling"] = {
		"ethereal:bamboo_dirt", ethereal.grow_sakura_tree
	},
	["ethereal:olive_tree_sapling"] = {
		"ethereal:grove_dirt", ethereal.grow_olive_tree
	},
	["ethereal:lemon_tree_sapling"] = {
		"ethereal:grove_dirt", ethereal.grow_lemon_tree
	},
}

ethereal.grow_sapling = function(pos, node)

	local light_level = minetest.get_node_light(pos) or 0

	if light_level < 13 then
		return
	end

	local under =  minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name

	if not minetest.registered_nodes[node.name] then
		return
	end

	local height = minetest.registered_nodes[node.name].grown_height

	-- do we have enough height to grow sapling into tree?
	if not height or not enough_height(pos, height) then
		return
	end

	-- Check if Ethereal Sapling is growing on correct substrate
	local sapling_data = saplings_map[node.name]
	if sapling_data then
		local expected_under, grow_func = sapling_data[1], sapling_data[2]
		if (expected_under == true and minetest.get_item_group(under, "soil") > 0)
			or under == expected_under then
			grow_func(pos)
		end
	end
end

-- Grow saplings
minetest.register_abm({
	label = "Ethereal grow sapling",
	nodenames = {"group:ethereal_sapling"},
	interval = 10,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		ethereal.grow_sapling(pos, node)
	end
})

-- 2x redwood saplings make 1x giant redwood sapling
minetest.register_craft({
	output = "ethereal:giant_redwood_sapling",
	recipe = {{"ethereal:redwood_sapling", "ethereal:redwood_sapling"}}
})

