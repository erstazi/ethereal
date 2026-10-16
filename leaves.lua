
local S = core.get_translator("ethereal")

-- set leaftype (0 for plantlike, 1 for block)

local leaftype = "plantlike"
local leafscale = 1.4

if ethereal.leaftype ~= 0 then
	leaftype = "allfaces_optional"
	leafscale = 1.0
end

-- leaf texture helper

local function l_tex(tex)

	if leaftype == "allfaces_optional" then
		return core.inventorycube(tex) -- 3d
	end

	return tex -- plantlike
end

-- override helper

local function override_leaf(name, texture, new_drop)

	local def = core.registered_nodes[name] ; if not def then return end
	local drops = new_drop or def.drop

	core.override_item(name, {
		drawtype = leaftype,
		visual_scale = leafscale,
		inventory_image = l_tex(texture),
		wield_image = l_tex(texture),
		walkable = ethereal.leafwalk,
		drop = drops
	})
end

-- override default leaves

override_leaf("default:leaves", "default_leaves.png")

override_leaf("default:jungleleaves", "default_jungleleaves.png")

override_leaf("default:acacia_leaves", "default_acacia_leaves.png")

override_leaf("default:aspen_leaves", "default_aspen_leaves.png")

override_leaf("default:pine_needles", "default_pine_needles.png", {
	max_items = 1, items = {
		{items = {"default:pine_sapling"}, rarity = 20},
		{items = {"ethereal:pine_nuts"}, rarity = 5},
		{items = {"default:pine_needles"}}
	}
})

-- register leaves helper

local function add_leaves(name, def)

	def.tiles = {def.texture}
	def.inventory_image = l_tex(def.texture)
	def.visual_scale = def.visual_scale or leafscale
	def.wield_image = l_tex(def.texture)
	def.texture = nil -- clear helper string
	def.description = S(def.description)
	def.drawtype = leaftype
	def.paramtype = "light"
	def.walkable = ethereal.leafwalk
	def.waving = 1
	def.groups = def.groups or {snappy = 3, leaves = 1, flammable = 2}
	def.sounds = default.node_sound_leaves_defaults()
	def.after_place_node = default.after_place_leaves

	core.register_node(name, def)
end

-- willow

local tex = "ethereal_willow_twig.png"

if ethereal.leaftype ~= 0 then
	tex = "ethereal_willow_twig_allfaces.png"
end

add_leaves("ethereal:willow_twig", {
	description = "Willow Twig",
	texture = tex,
	visual_scale = 1.4,
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:willow_sapling"}, rarity = 50},
			{items = {"ethereal:willow_twig"}}
		}
	}
})

-- redwood

add_leaves("ethereal:redwood_leaves", {
	description = "Redwood Leaves",
	texture = "ethereal_redwood_leaves.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:redwood_sapling"}, rarity = 80},
			{items = {"ethereal:redwood_leaves"}}
		}
	}
})

-- orange tree

add_leaves("ethereal:orange_leaves", {
	description = "Orange Leaves",
	texture = "ethereal_orange_leaves.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:orange_tree_sapling"}, rarity = 15},
			{items = {"ethereal:orange_leaves"}}
		}
	}
})

-- banana tree

add_leaves("ethereal:bananaleaves", {
	description = "Banana Leaves",
	texture = "ethereal_banana_leaf.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:banana_tree_sapling"}, rarity = 10},
			{items = {"ethereal:bananaleaves"}}
		}
	}
})

-- healing tree

add_leaves("ethereal:yellowleaves", {
	description = "Healing Tree Leaves",
	texture = "ethereal_yellow_leaves.png",
	light_source = 9,
	groups = {snappy = 3, leaves = 1, eatable = 1},
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:yellow_tree_sapling"}, rarity = 50},
			{items = {"ethereal:yellowleaves"}}
		}
	},
	on_use = core.item_eat(1)
})

-- palm tree

add_leaves("ethereal:palmleaves", {
	description = "Palm Leaves",
	texture = "moretrees_palm_leaves.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:palm_sapling"}, rarity = 10},
			{items = {"ethereal:palmleaves"}}
		}
	}
})

-- birch tree

add_leaves("ethereal:birch_leaves", {
	description = "Birch Leaves",
	texture = "moretrees_birch_leaves.png",
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:birch_sapling"}, rarity = 20},
			{items = {"ethereal:birch_leaves"}}
		}
	}
})

-- magical birch (cyan)

add_leaves("ethereal:birch_leaves2", {
	description = "Magical Birch Leaves",
	texture = "moretrees_birch_leaves_white.png^[multiply:#259797",
	light_source = 2,
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:birch_sapling"}, rarity = 20},
			{items = {"ethereal:birch_leaves2"}}
		}
	}
})

-- magical birch (violet)

add_leaves("ethereal:birch_leaves3", {
	description = "Magical Birch Leaves",
	texture = "moretrees_birch_leaves_white.png^[multiply:#da70d6",
	light_source = 2,
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:birch_sapling"}, rarity = 20},
			{items = {"ethereal:birch_leaves3"}}
		}
	}
})

-- magical birch (gold)

add_leaves("ethereal:birch_leaves4", {
	description = "Magical Birch Leaves",
	texture = "moretrees_birch_leaves_white.png^[multiply:#da9100",
	light_source = 2,
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:birch_sapling"}, rarity = 20},
			{items = {"ethereal:birch_leaves4"}}
		}
	}
})

-- frost tree leaves

add_leaves("ethereal:frost_leaves", {
	description = "Frost Leaves",
	texture = "ethereal_frost_leaves.png",
	light_source = 9,
	groups = {snappy = 3, leaves = 1, puts_out_fire = 1},
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:frost_tree_sapling"}, rarity = 15},
			{items = {"ethereal:frost_leaves"}}
		}
	}
})

-- bamboo stalk leaves

add_leaves("ethereal:bamboo_leaves", {
	description = "Bamboo Leaves",
	texture = "ethereal_bamboo_leaves.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:bamboo_sprout"}, rarity = 10},
			{items = {"ethereal:bamboo_leaves"}}
		}
	}
})

-- sakura leaves

add_leaves("ethereal:sakura_leaves", {
	description = "Sakura Leaves",
	texture = "ethereal_sakura_leaves.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:sakura_sapling"}, rarity = 30},
			{items = {"ethereal:sakura_leaves"}}
		}
	}
})

add_leaves("ethereal:sakura_leaves2", {
	description = "Sakura Leaves",
	texture = "ethereal_sakura_leaves2.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:sakura_sapling"}, rarity = 30},
			{items = {"ethereal:sakura_leaves2"}}
		}
	}
})

-- lemon tree leaves

add_leaves("ethereal:lemon_leaves", {
	description = "Lemon Tree Leaves",
	texture = "ethereal_lemon_leaves.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:lemon_tree_sapling"}, rarity = 25},
			{items = {"ethereal:lemon_leaves"}}
		}
	}
})

-- olive tree leaves

add_leaves("ethereal:olive_leaves", {
	description = "Olive Tree Leaves",
	texture = "ethereal_olive_leaves.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:olive_tree_sapling"}, rarity = 25},
			{items = {"ethereal:olive_leaves"}}
		}
	}
})

-- mangrove tree leaves

add_leaves("ethereal:mangrove_leaves", {
	description = "Mangrove Leaves",
	texture = "mcl_mangrove_leaves.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:mangrove_sapling"}, rarity = 25},
			{items = {"ethereal:mangrove_leaves"}}
		}
	}
})

-- poplar leaves

add_leaves("ethereal:poplar_leaves_red", {
	description = "Red Poplar Leaves",
	texture = "ethereal_poplar_leaves_red.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:poplar_sapling"}, rarity = 50},
			{items = {"ethereal:poplar_leaves_red"}}
		}
	}
})

add_leaves("ethereal:poplar_leaves_orange", {
	description = "Orange Poplar Leaves",
	texture = "ethereal_poplar_leaves_orange.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:poplar_sapling"}, rarity = 50},
			{items = {"ethereal:poplar_leaves_orange"}}
		}
	}
})

add_leaves("ethereal:poplar_leaves_yellow", {
	description = "Yellow Poplar Leaves",
	texture = "ethereal_poplar_leaves_yellow.png",
	drop = {
		max_items = 1, items = {
			{items = {"ethereal:poplar_sapling"}, rarity = 50},
			{items = {"ethereal:poplar_leaves_yellow"}}
		}
	}
})

-- red mushroom top

core.register_node("ethereal:mushroom", {
	description = S("Mushroom Cap"),
	tiles = {"ethereal_mushroom_block.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:mushroom_sapling"}, rarity = 20},
			{items = {"ethereal:mushroom"}}
		}
	},
	sounds = default.node_sound_wood_defaults()
})

core.register_craft({ type = "fuel", recipe = "ethereal:mushroom", burntime = 10 })

-- brown mushroom top

core.register_node("ethereal:mushroom_brown", {
	description = S("Brown Mushroom Cap"),
	tiles = {"ethereal_mushroom_block_brown.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:mushroom_brown_sapling"}, rarity = 15},
			{items = {"ethereal:mushroom_brown"}}
		}
	},
	sounds = default.node_sound_wood_defaults()
})

core.register_craft({ type = "fuel", recipe = "ethereal:mushroom_brown", burntime = 10 })

-- mushroom pore (spongelike material found inside giant shrooms)

core.register_node("ethereal:mushroom_pore", {
	description = S("Mushroom Pore"),
	tiles = {"ethereal_mushroom_pore.png"},
	groups = {
		snappy = 3, cracky = 3, choppy = 3, oddly_breakable_by_hand = 3,
		flammable = 2, disable_jump = 1, fall_damage_add_percent = -100
	},
	sounds = default.node_sound_dirt_defaults()
})

core.register_craft({ type = "fuel", recipe = "ethereal:mushroom_pore", burntime = 3 })

-- hedge block

core.register_node("ethereal:bush", {
	description = S("Bush"),
	tiles = {"ethereal_bush.png"},
	walkable = true,
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_leaves_defaults()
})

core.register_craft({
	output = "ethereal:bush",
	recipe = {
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:leaves", "ethereal:bamboo_leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"}
	}
})

core.register_craft({ type = "fuel", recipe = "ethereal:bush", burntime = 9 })

-- bush block #2

core.register_node("ethereal:bush2", {
	drawtype = "allfaces_optional",
	description = S("Bush #2"),
	tiles = {"default_aspen_leaves.png"},
	paramtype = "light",
	walkable = true,
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_leaves_defaults()
})

core.register_craft({
	output = "ethereal:bush2",
	recipe = {
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:leaves", "default:aspen_leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"}
	}
})

core.register_craft({ type = "fuel", recipe = "ethereal:bush2", burntime = 9 })

-- pine needles bush (replaces bush 3)

core.register_alias("ethereal:bush3", "default:pine_bush_needles")

-- basandra bush stem, leaves

core.register_node("ethereal:basandra_bush_stem", {
	description = S("Basandra Bush Stem"),
	drawtype = "plantlike",
	visual_scale = 1.41,
	walkable = false,
	damage_per_second = 2,
	tiles = {"ethereal_basandra_bush_stem.png"},
	inventory_image = "ethereal_basandra_bush_stem.png",
	wield_image = "ethereal_basandra_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed", fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	}
})

core.register_node("ethereal:basandra_bush_leaves", {
	description = S("Basandra Bush Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"ethereal_basandra_bush_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:basandra_bush_sapling"}, rarity = 5},
			{items = {"ethereal:basandra_bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults()
})

-- leafdecay helper function

local function decay(tru, lea, rad)
	default.register_leafdecay({trunks = tru, leaves = lea, radius = rad})
end

-- add leafdecay registrations

core.after(0, function() -- wait until mods loaded for this one

	local nods = {"default:apple", "default:leaves", "ethereal:orange", "ethereal:vine",
			"ethereal:orange_leaves", "ethereal:lemon", "ethereal:lemon_leaves"}

	if core.get_modpath("nature_classic") and core.registered_nodes["nature:blossom"] then
		table.insert(nods, "nature:blossom")
	end

	decay({"default:tree"}, nods, 3)
end)

decay({"ethereal:willow_trunk"}, {"ethereal:willow_twig"}, 3)

decay({"ethereal:redwood_trunk"}, {"ethereal:redwood_leaves"}, 3)

decay({"ethereal:frost_tree"}, {"ethereal:frost_leaves"}, 3)

decay({"ethereal:yellow_trunk"}, {"ethereal:yellowleaves", "ethereal:golden_apple"}, 3)

decay({"ethereal:palm_trunk"}, {"ethereal:palmleaves", "ethereal:coconut"}, 3)

decay({"ethereal:banana_trunk"}, {"ethereal:bananaleaves", "ethereal:banana",
		"ethereal:banana_bunch"}, 3)

decay({"ethereal:birch_trunk"}, {"ethereal:birch_leaves", "ethereal:birch_leaves2",
		"ethereal:birch_leaves3", "ethereal:birch_leaves4"}, 3)

decay({"ethereal:bamboo"}, {"ethereal:bamboo_leaves"}, 3)

decay({"ethereal:sakura_trunk"}, {"ethereal:sakura_leaves", "ethereal:sakura_leaves2"}, 3)

decay({"ethereal:olive_trunk"}, {"ethereal:olive_leaves", "ethereal:olive"}, 3)

decay({"ethereal:mushroom_trunk"}, {"ethereal:mushroom", "ethereal:mushroom_brown",
		"ethereal:mushroom_pore", "ethereal:lightstring"}, 4)

decay({"ethereal:mangrove_tree"}, {"ethereal:mangrove_leaves", "ethereal:mangrove_roots",
		"ethereal:vine"}, 4)

decay({"ethereal:poplar_trunk"}, {"ethereal:poplar_leaves_red",
		"ethereal:poplar_leaves_orange", "ethereal:poplar_leaves_yellow"}, 3)

-- falling leaf particles

if core.settings:get_bool("ethereal.leaf_particles") ~= false then

	local leaf_list = {
		["ethereal:frost_leaves"] = {"331b37", 9},
		["ethereal:bananaleaves"] = {"b1b169"}, --{"28581e"},
		["ethereal:lemon_leaves"] = {"507c1e"},
		["ethereal:olive_leaves"] = {"416531"},
		["ethereal:orange_leaves"] = {"1a3b1b"},
		["ethereal:redwood_leaves"] = {"15342a"},
		["ethereal:sakura_leaves"] = {"c281a9"},
		["ethereal:sakura_leaves2"] = {"d4cbac"},
		["ethereal:willow_twig"] = {"0b9445"},
		["ethereal:yellowleaves"] = {"8b5f00", 9},
		["ethereal:birch_leaves"] = {"274527"},
		["ethereal:birch_leaves2"] = {"259797", 2},
		["ethereal:birch_leaves3"] = {"da70d6", 2},
		["ethereal:birch_leaves4"] = {"da9100", 2},
		["ethereal:palmleaves"] = {"b1b169"},--{"2b6000"},
		["ethereal:bamboo_leaves"] = {"445811"},
		["ethereal:mangrove_leaves"] = {"6a7039"},
		["ethereal:poplar_leaves_red"] = {"882d2a"},
		["ethereal:poplar_leaves_orange"] = {"935330"},
		["ethereal:poplar_leaves_yellow"] = {"956c2e"},
		["default:acacia_leaves"] = {"296600"},
		["default:aspen_leaves"] = {"395d16"},
		["default:jungleleaves"] = {"141e10"},
		["default:pine_needles"] = {"00280e"},
		["default:leaves"] = {"223a20"},
		["xnether:purple_leaves"] = {"bf007b"},
		["xnether:blue_leaves"] = {"44acda"}
	}

	-- make leaf table for search instead of using group:leaves
	local leaf_nodes = {}

	for name in pairs(leaf_list) do
		leaf_nodes[#leaf_nodes + 1] = name
	end

	local tweenable = core.features.particlespawner_tweenable and true
--[[
	core.register_abm({
		label = "Ethereal falling leaves",
		nodenames = leaf_nodes,
		neighbors = {"air"},
		interval = 8,
		chance = 90,
		catch_up = false,

		action = function(pos, node, aoc, aocw)

			local prop = leaf_list[node.name] ; if not prop then return end

			local def = {
				amount = 1, time = 2,
				minpos = {x = pos.x - 0.4, y = pos.y - 1, z = pos.z - 0.4},
				maxpos = {x = pos.x + 0.4, y = pos.y - 1, z = pos.z + 0.4},
				minvel = {x = -0.8, y = -1, z = -0.8},
				maxvel = {x = 0.8, y = -3, z = 0.8},
				minacc = {x = -0.05, y = -0.1, z = -0.05},
				maxacc = {x = 0.05, y = -0.3, z = 0.05},
				minexptime = 5, maxexptime = 10,
				minsize = 3, maxsize = 4,
				collisiondetection = true,
				collision_removal = true,
				texture = "ethereal_falling_leaf.png^[multiply:#" .. prop[1],
				vertical = true,
				glow = prop[2]
			}

			if tweenable then
				def.texture = "ethereal_falling_leaf_animated.png^[multiply:#" .. prop[1]
				def.animation = {
					type = 'vertical_frames', aspect_w = 16, aspect_h = 16, length = 1
				}
			end

			core.add_particlespawner(def)
		end
	})
]]--

	-- A different way of doing falling leaves, only show leaf particles to the
	-- player that is in their current fov

	local function leaf_particle(pos, prop, playername)

		local def = {
			amount = 1, time = 2,
			minpos = {x = pos.x - 0.4, y = pos.y - 0.55, z = pos.z - 0.4}, -- below leaf
			maxpos = {x = pos.x + 0.4, y = pos.y - 0.55, z = pos.z + 0.4},
			minvel = {x = -0.8, y = -1, z = -0.8},
			maxvel = {x = 0.8, y = -3, z = 0.8},
			minacc = {x = -0.05, y = -0.1, z = -0.05}, -- slow falling
			maxacc = {x = 0.05, y = -0.3, z = 0.05},
			minexptime = 5, maxexptime = 10,
			minsize = 3, maxsize = 4,
			collisiondetection = true,
			collision_removal = true,
			texture = "ethereal_falling_leaf.png^[multiply:#" .. prop[1],
			vertical = true,
			glow = prop[2],
			playername = playername -- only player can see particles
		}

		if tweenable then
			def.texture = "ethereal_falling_leaf_animated.png^[multiply:#" .. prop[1]
			def.animation = {
					type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1}
		end

		core.add_particlespawner(def)
	end

	-- localize a few things to hopefully speed things up
	local connected_players = core.get_connected_players
	local find_nodes_in_area = core.find_nodes_in_area
	local math_min, math_random, get_node = math.min, math.random, core.get_node
	local timer = 0

	core.register_globalstep(function(dtime)

		timer = timer + dtime ; if timer < 5 then return end ; timer = 0

		for _, player in ipairs(connected_players()) do

			local ppos = player:get_pos()
			local pname = player:get_player_name()
			local dir = player:get_look_dir()

			-- only search in the area the player is looking
			local center = {
				x = ppos.x + dir.x * 10,
				y = ppos.y + dir.y * 2,
				z = ppos.z + dir.z * 10
			}

			local minp = {x = center.x - 8 , y = center.y - 1, z = center.z - 8}
			local maxp = {x = center.x + 8, y = center.y + 10, z = center.z + 8}
			local leaves = find_nodes_in_area(minp, maxp, leaf_nodes)
			local count = #leaves

-- testing only
--for _,pos in ipairs(leaves) do
--	core.add_particle({pos = pos, texture = "heart.png", glow = 5,
--		expirationtime = 5, size = 6, collisiondetection = false, vertical = false})
--end

			if count > 0 then

				local amount = math_min(count, 3) -- max 3 particles

				for _ = 1, amount do

					local pos = leaves[math_random(1, count)]
					local node = get_node(pos)
					local prop = leaf_list[node.name]

					if prop then
						leaf_particle(pos, prop, pname)
					end
				end
			end
		end
	end)
end
