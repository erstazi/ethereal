
local S = core.get_translator("ethereal")

-- register wood and placement helper

local function add_wood(name, def)

	def.sounds = default.node_sound_wood_defaults() -- some defaults
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.description = S(def.description)
	def.groups = def.groups or {wood = 1, choppy = 2, oddly_breakable_by_hand = 1,
			flammable = 3}

	local newname = "ethereal:" .. name

	if ethereal.wood_rotate then
		def.on_place = core.rotate_node
	else
		def.place_param2 = 0
	end

	core.register_node(newname, def)
end

-- register trunk helper

local function add_trunk(name, def, wood)

	def.description = S(def.description)
	def.sounds = default.node_sound_wood_defaults()
	def.paramtype2 = "facedir"
	def.on_place = core.rotate_node
	def.groups = def.groups or {tree = 1, choppy = 2, oddly_breakable_by_hand = 1,
			flammable = 2}

	local newname = "ethereal:" .. name

	core.register_node(newname, def)

	if wood then -- if wood given then recipe added for tree > wood

		core.register_craft({
			output = "ethereal:" .. wood .. " 4", recipe = {{newname}}
		})
	end
end

-- register all-faces trunk helper

local function add_allfaces(name, def, wood)

	def.description = S("All-faces") .. " " .. S(def.description)
	def.sounds = default.node_sound_wood_defaults()
	def.groups = def.groups or {tree = 1, choppy = 2, oddly_breakable_by_hand = 1,
			flammable = 2}

	local oldname = "ethereal:" .. name
	local newname = "ethereal:all_faces_" .. name

	core.register_node(newname, def)

	core.register_craft({
		output = newname .. " 8",
		recipe = {
			{oldname, oldname, oldname},
			{oldname, "", oldname},
			{oldname, oldname, oldname}
		}
	})

	if wood then -- if wood given then recipe added for allfaces tree > wood

		core.register_craft({
			output = "ethereal:" .. wood .. " 4", recipe = {{newname}}
		})
	end
end

-- poplar

add_trunk("poplar_trunk", {
	description = "Poplar Trunk",
	tiles = {
		"ethereal_poplar_trunk_top.png", "ethereal_poplar_trunk_top.png",
		"ethereal_poplar_trunk.png"
	}
}, "poplar_wood")

add_wood("poplar_wood", {
	description = "Poplar Wood", tiles = {"ethereal_poplar_wood.png"}
})

add_allfaces("poplar_trunk", {
	description = "Poplar Trunk", tiles = {"ethereal_poplar_trunk_top.png"}
}, "poplar_wood")

-- basandra

add_wood("basandra_wood", {
	description = "Basandra Wood", tiles = {"ethereal_basandra_bush_wood.png"},
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1} -- not flammable
})

core.register_craft({
	output = "ethereal:basandra_wood 2", recipe = {{"ethereal:basandra_bush_stem"}}
})

-- sakura

add_trunk("sakura_trunk", {
	description = "Sakura Trunk",
	tiles = {
		"ethereal_sakura_trunk_top.png", "ethereal_sakura_trunk_top.png",
		"ethereal_sakura_trunk.png"
	}
}, "sakura_wood")

add_wood("sakura_wood", {
	description = "Sakura Wood", tiles = {"ethereal_sakura_wood.png"}
})

add_allfaces("sakura_trunk", {
	description = "Sakura Trunk", tiles = {"ethereal_sakura_trunk_top.png"}
}, "sakura_wood")

-- Mangrove

add_trunk("mangrove_tree", {
	description = "Mangrove Trunk",
	tiles = {
		"mcl_mangrove_log_top.png", "mcl_mangrove_log_top.png",
		"mcl_mangrove_log.png"
	}
}, "mangrove_wood")

add_wood("mangrove_wood", {
	description = "Mangrove Wood", tiles = {"mcl_mangrove_planks.png"}
})

add_allfaces("mangrove_tree", {
	description = "Mangrove Trunk", tiles = {"mcl_mangrove_log_top.png"}
}, "mangrove_wood")

-- mangrove roots

core.register_node("ethereal:mangrove_roots", {
	description = S("Mangrove Roots"),
	waving = 0, walkable = false, climbable = true,
	place_param2 = 1, -- Prevent leafdecay for placed nodes
	tiles = {
		"mcl_mangrove_roots_top.png",
		"mcl_mangrove_roots_side.png", "mcl_mangrove_roots_side.png",
	},
	paramtype = "light",
	drawtype = "allfaces_optional",
	groups = {snappy = 3, choppy = 3, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

-- willow

add_trunk("willow_trunk", {
	description = "Willow Trunk",
	tiles = {
		"ethereal_willow_trunk_top.png", "ethereal_willow_trunk_top.png",
		"ethereal_willow_trunk.png"
	}
}, "willow_wood")

add_wood("willow_wood", {
	description = "Willow Wood", tiles = {"ethereal_willow_wood.png"}
})

add_allfaces("willow_trunk", {
	description = "Willow Trunk", tiles = {"ethereal_willow_trunk_top.png"}
}, "willow_wood")

-- redwood

add_trunk("redwood_trunk", {
	description = "Redwood Trunk",
	tiles = {
		"ethereal_redwood_trunk_top.png", "ethereal_redwood_trunk_top.png",
		"ethereal_redwood_trunk.png"
	}
}, "redwood_wood")

add_wood("redwood_wood", {
	description = "Redwood Wood", tiles = {"ethereal_redwood_wood.png"}
})

add_allfaces("redwood_trunk", {
	description = "Redwood Trunk", tiles = {"ethereal_redwood_trunk_top.png"}
}, "redwood_wood")

-- frost

add_trunk("frost_tree", {
	description = "Frost Tree",
	tiles = {
		"ethereal_frost_tree_top.png", "ethereal_frost_tree_top.png",
		"ethereal_frost_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, puts_out_fire = 1}
}, "frost_wood")

add_wood("frost_wood", {
	description = "Frost Wood", tiles = {"ethereal_frost_wood.png"},
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1}
})

add_allfaces("frost_tree", {
	description = "Frost Tree", tiles = {"ethereal_frost_tree_top.png"}
}, "frost_wood")

-- healing

add_trunk("yellow_trunk", {
	description = "Healing Tree Trunk",
	tiles = {
		"ethereal_yellow_tree_top.png", "ethereal_yellow_tree_top.png",
		"ethereal_yellow_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, puts_out_fire = 1}
}, "yellow_wood")

add_wood("yellow_wood", {
	description = "Healing Tree Wood", tiles = {"ethereal_yellow_wood.png"},
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1}
})

add_allfaces("yellow_trunk", {
	description = "Healing Trunk", tiles = {"ethereal_yellow_tree_top.png"}
}, "yellow_wood")

-- palm (thanks to VanessaE for palm textures)

add_trunk("palm_trunk", {
	description = "Palm Trunk",
	tiles = {
		"moretrees_palm_trunk_top.png", "moretrees_palm_trunk_top.png",
		"moretrees_palm_trunk.png"
	}
}, "palm_wood")

add_wood("palm_wood", {
	description = "Palm Wood", tiles = {"moretrees_palm_wood.png"}
})

add_allfaces("palm_trunk", {
	description = "Palm Trunk", tiles = {"moretrees_palm_trunk_top.png"}
}, "palm_wood")

-- banana

add_trunk("banana_trunk", {
	description = "Banana Trunk",
	tiles = {
		"ethereal_banana_trunk_top.png", "ethereal_banana_trunk_top.png",
		"ethereal_banana_trunk.png"
	}
}, "banana_wood")

add_wood("banana_wood", {
	description = "Banana Wood", tiles = {"ethereal_banana_wood.png"}
})

add_allfaces("banana_trunk", {
	description = "Banana Trunk", tiles = {"ethereal_banana_trunk_top.png"}
}, "banana_wood")

-- scorched

add_trunk("scorched_tree", {
	description = "Scorched Tree",
	tiles = {
		"ethereal_scorched_tree_top.png", "ethereal_scorched_tree_top.png",
		"ethereal_scorched_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 1}
})

core.register_craft({
	output = "ethereal:scorched_tree 8",
	recipe = {
		{"group:tree", "group:tree", "group:tree"},
		{"group:tree", "default:torch", "group:tree"},
		{"group:tree", "group:tree", "group:tree"}
	}
})

add_allfaces("scorched_tree", {
	description = "Scorched Tree", tiles = {"ethereal_scorched_tree_top.png"}
})

-- mushroom

add_trunk("mushroom_trunk", {
	description = "Mushroom Trunk",
	tiles = {
		"ethereal_mushroom_trunk_top.png", "ethereal_mushroom_trunk_top.png",
		"ethereal_mushroom_trunk.png"
	}
})

add_allfaces("mushroom_trunk", {
	description = "Mushroom Trunk", tiles = {"ethereal_mushroom_trunk_top.png"}
})

-- birch (thanks to VanessaE for birch textures)

add_trunk("birch_trunk", {
	description = "Birch Trunk",
	tiles = {
		"moretrees_birch_trunk_top.png", "moretrees_birch_trunk_top.png",
		"moretrees_birch_trunk.png"
	}
}, "birch_wood")

add_wood("birch_wood", {
	description = "Birch Wood", tiles = {"moretrees_birch_wood.png"}
})

add_allfaces("birch_trunk", {
	description = "Birch Trunk", tiles = {"moretrees_birch_trunk_top.png"}
}, "birch_wood")

-- olive

add_trunk("olive_trunk", {
	description = "Olive Trunk",
	tiles = {
		"ethereal_olive_trunk_top.png", "ethereal_olive_trunk_top.png",
		"ethereal_olive_trunk.png"
	}
}, "olive_wood")

add_wood("olive_wood", {
	description = "Olive Wood", tiles = {"ethereal_olive_wood.png"}
})

add_allfaces("olive_trunk", {
	description = "Olive Trunk", tiles = {"ethereal_olive_trunk_top.png"}
}, "olive_wood")

-- Bamboo

core.register_node("ethereal:bamboo", {
	description = S("Bamboo"),
	drawtype = "plantlike",
	tiles = {"ethereal_bamboo_trunk.png"},
	inventory_image = "ethereal_bamboo_trunk.png",
	wield_image = "ethereal_bamboo_trunk.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	selection_box = {
		type = "fixed", fixed = {-0.15, -0.5, -0.15, 0.15, 0.5, 0.15}
	},
	collision_box = {
		type = "fixed", fixed = {-0.15, -0.5, -0.15, 0.15, 0.5, 0.15}
	},
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),

	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end
})

core.register_craft({ type = "fuel", recipe = "ethereal:bamboo", burntime = 2 })

-- Bamboo block

local tmp = "ethereal:bamboo"

add_wood("bamboo_block", {
	description = "Bamboo Block", tiles = {"ethereal_bamboo_floor.png"},
	groups = {wood = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2}
})

core.register_craft({
	output = "ethereal:bamboo_block",
	recipe = { {tmp, tmp, tmp}, {tmp, tmp, tmp}, {tmp, tmp, tmp} }
})
