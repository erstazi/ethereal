
local S = core.get_translator("ethereal")

-- barrel cactus

core.register_node("ethereal:barrel_cactus", {
	description = S("Barrel Cactus"),
	drawtype = "plantlike",
	visual_scale = 0.8,
	tiles = {"ethereal_barrel_cactus.png"},
	inventory_image = "ethereal_barrel_cactus.png",
	wield_image = "ethereal_barrel_cactus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
flora_substrate = "default:desert_sand",
	damage_per_second = 1,
	groups = {snappy = 3, attached_node = 1, flammable = 2, flora = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},
	on_use = core.item_eat(1)
})

core.register_craft({
	output = "default:cactus",
	recipe = {
		{"ethereal:barrel_cactus", "ethereal:barrel_cactus"},
		{"ethereal:barrel_cactus", "ethereal:barrel_cactus"}
	}
})

-- tawny grass

core.register_node("ethereal:tawny_grass", {
	description = S("Tawny Grass"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"ethereal_tawny_grass.png"},
	inventory_image = "ethereal_tawny_grass.png",
	wield_image = "ethereal_tawny_grass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	light_source = 1,
flora_substrate = "ethereal:tawny_dirt",
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	}
})

-- red shrub

core.register_node("ethereal:shrub_red", {
	description = S("Red Shrub"),
	drawtype = "plantlike",
	visual_scale = 1.1,
	tiles = {"ethereal_shrub_red.png"},
	inventory_image = "ethereal_shrub_red.png",
	wield_image = "ethereal_shrub_red.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 10,
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
flora_substrate = "ethereal:tawny_dirt",
	groups = {snappy = 3, attached_node = 1, flammable = 2, flora = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	}
})

core.register_craft({ output = "dye:red 2", recipe = {{"ethereal:shrub_red"}} })

-- leaf litter

core.register_node("ethereal:leaf_litter", {
	description = S("Leaf Litter"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "wallmounted",
	use_texture_alpha = "clip",
	tiles = {"ethereal_leaf_litter.png"},
	inventory_image = "ethereal_leaf_litter.png",
	wield_image = "ethereal_leaf_litter.png",
	node_box = {
			type = "wallmounted",
			wall_top = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
	selection_box = {type = "wallmounted"},
	legacy_wallmounted = true,
	groups = {snappy = 3, attached_node = 1, flammable = 2},
	is_ground_content = true,
	buildable_to = true,
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({ type = "fuel", recipe = "ethereal:leaf_litter", burntime = 1 })

-- Magical grass

core.register_node("ethereal:magical_grass", {
	description = S("Magical Grass"),
	drawtype = "plantlike",
	waving = 1,
	paramtype2 ="meshoptions",
place_param2 = 3,
	tiles = {"ethereal_magical_grass.png"},
	inventory_image = "ethereal_magical_grass.png",
	wield_image = "ethereal_magical_grass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	light_source = 1,
flora_substrate = "ethereal:magical_dirt",
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	}
})

-- Cactus flower

core.register_node("ethereal:cactus_flower", {
	description = S("Cactus Flower"),
	drawtype = "plantlike",
	tiles = {"ethereal_cactus_flower.png"},
	inventory_image = "ethereal_cactus_flower.png",
	wield_image = "ethereal_cactus_flower.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 3 / 16, 4 / 16}
	},
	on_use = core.item_eat(1)
})

ethereal.add_eatable("ethereal:cactus_flower", 1)

core.register_craft({ output = "dye:violet 2", recipe = {{"ethereal:cactus_flower"}} })

-- Spore Grass

core.register_node("ethereal:spore_grass", {
	description = S("Spore Grass"),
	drawtype = "plantlike",
	tiles = {"ethereal_spore_grass.png"},
	inventory_image = "ethereal_spore_grass.png",
	wield_image = "ethereal_spore_grass.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
flora_substrate = "ethereal:mushroom_dirt",
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16}
	}
})

-- Firethorn (poisonous when eaten raw, must be crushed and washed with water 1st)

core.register_node("ethereal:firethorn", {
	description = S("Firethorn Shrub"),
	drawtype = "plantlike",
	tiles = {"ethereal_firethorn.png"},
	inventory_image = "ethereal_firethorn.png",
	wield_image = "ethereal_firethorn.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
flora_substrate = {"ethereal:cold_dirt", "default:dirt_with_snow"},
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16}
	}
})

-- Fire Flower

core.register_node("ethereal:fire_flower", {
	description = S("Fire Flower"),
	drawtype = "plantlike",
	tiles = { "ethereal_fire_flower.png" },
	inventory_image = "ethereal_fire_flower.png",
	wield_image = "ethereal_fire_flower.png",
	paramtype = "light",
	light_source = 5,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	damage_per_second = 2,
	groups = {snappy = 1, oddly_breakable_by_hand = 3, igniter = 2, falling_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 1 / 2, 5 / 16}
	},

	on_punch = function(pos, node, puncher) -- hurts when punched

		puncher:punch(puncher, 1.0, {
				full_punch_interval = 1.0, damage_groups = {fleshy = 2}}, nil)
	end
})

core.register_craft({ type = "fuel", recipe = "ethereal:fire_flower", burntime = 20 })

-- Fire Dust

core.register_craftitem("ethereal:fire_dust", {
	description = S("Fire Dust"),
	inventory_image = "ethereal_fire_dust.png"
})

core.register_craft({
	output = "ethereal:fire_dust 2",
	recipe = {{"ethereal:fire_flower"}}
})

core.register_craft({ type = "fuel", recipe = "ethereal:fire_dust", burntime = 10 })

-- vines

core.register_node("ethereal:vine", {
	description = S("Vine"),
	drawtype = "signlike",
	tiles = {"ethereal_vine.png"},
	inventory_image = "ethereal_vine.png",
	wield_image = "ethereal_vine.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {type = "wallmounted"},
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_leaves_defaults()
})

core.register_craft({
	output = "ethereal:vine 2",
	recipe = {
		{"group:leaves", "", "group:leaves"},
		{"", "group:leaves", ""},
		{"group:leaves", "", "group:leaves"}
	}
})

-- light strings (glowing vine)

core.register_node("ethereal:lightstring", {
	description = S("Light String Vine"),
	drawtype = "signlike",
	tiles = {"ethereal_lightstring.png"},
	inventory_image = "ethereal_lightstring.png",
	wield_image = "ethereal_lightstring.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 10,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {type = "wallmounted"},
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_leaves_defaults()
})

core.register_craft({
	output = "ethereal:lightstring 8",
	recipe = {
		{"ethereal:vine", "ethereal:vine", "ethereal:vine"},
		{"ethereal:vine", "ethereal:fire_dust", "ethereal:vine"},
		{"ethereal:vine", "ethereal:vine", "ethereal:vine"}
	}
})

-- Boston Fern

core.register_node("ethereal:fern", {
	description = S("Fern"),
	drawtype = "plantlike",
	visual_scale = 1.4,
	tiles = {"ethereal_fern.png"},
	inventory_image = "ethereal_fern.png",
	wield_image = "ethereal_fern.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:fern_tubers"}, rarity = 6},
			{items = {"ethereal:fern"}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16}
	}
})

-- Boston Ferns sometimes drop edible Tubers

core.register_craftitem("ethereal:fern_tubers", {
	description = S("Fern Tubers"),
	inventory_image = "ethereal_fern_tubers.png",
	groups = {food_tuber = 1},
	on_use = core.item_eat(1)
})

ethereal.add_eatable("ethereal:fern_tubers", 1)

-- Red Shrub (not flammable)

core.register_node("ethereal:dry_shrub", {
	description = S("Fiery Dry Shrub"),
	drawtype = "plantlike",
	tiles = {"ethereal_dry_shrub.png"},
	inventory_image = "ethereal_dry_shrub.png",
	wield_image = "ethereal_dry_shrub.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
flora_substrate = "ethereal:fiery_dirt",
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16}
	}
})

-- Grey Shrub (not Flammable - too cold to burn)

core.register_node("ethereal:snowygrass", {
	description = S("Snowy Grass"),
	drawtype = "plantlike",
	visual_scale = 0.9,
	tiles = {"ethereal_snowygrass.png"},
	inventory_image = "ethereal_snowygrass.png",
	wield_image = "ethereal_snowygrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
flora_substrate = "ethereal:gray_dirt",
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 5 / 16, 5 / 16}
	}
})

-- Crystal Shrub (not Flammable - too cold to burn)

core.register_node("ethereal:crystalgrass", {
	description = S("Crystal Grass"),
	drawtype = "plantlike",
	visual_scale = 0.9,
	tiles = {"ethereal_crystalgrass.png"},
	inventory_image = "ethereal_crystalgrass.png",
	wield_image = "ethereal_crystalgrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
flora_substrate = "ethereal:crystal_dirt",
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 5 / 16, 5 / 16}
	}
})

-- tall lilac

core.register_node("ethereal:lilac", {
	description = S("Lilac"),
	drawtype = "plantlike",
	visual_scale = 1.9,
	tiles = {"ethereal_lilac.png"},
	inventory_image = "ethereal_lilac.png",
	wield_image = "ethereal_lilac.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed", fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16}
	}
})

core.register_craft({ output = "dye:magenta 2", recipe = {{"ethereal:lilac"}} })

-- moss helper function

local function add_moss(desc, texture, recipe_item)

	local name = desc:lower()

	core.register_node("ethereal:" .. name .. "_moss", {
		description = S(desc .. " Moss"),
		tiles = {texture},
		groups = {crumbly = 3},
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.4}
		})
	})

	core.register_craft({
		output = "ethereal:" .. name .. "_moss",
		recipe = {{recipe_item, "default:dirt", recipe_item}}
	})
end

-- add moss types (has grass texture on all sides)

add_moss("Crystal", "ethereal_grass_crystal_top.png", "ethereal:frost_leaves")
add_moss("Mushroom", "ethereal_grass_mushroom_top.png", "ethereal:spore_grass")
add_moss("Fiery", "ethereal_grass_fiery_top.png", "ethereal:dry_shrub")
add_moss("Gray", "ethereal_grass_gray_top.png", "ethereal:snowygrass")
add_moss("Green", "default_grass.png", "default:jungleleaves")
add_moss("Bamboo", "ethereal_grass_bamboo_top.png", "ethereal:bamboo_leaves")
add_moss("Prairie", "ethereal_grass_prairie_top.png", "ethereal:orange_leaves")
add_moss("Cold", "ethereal_grass_cold_top.png", "default:pine_needles")
add_moss("Magical", "ethereal_grass_magical_top.png", "ethereal:magical_grass")
add_moss("Tawny", "ethereal_grass_tawny_top.png", "ethereal:tawny_grass")

-- shroom helper function

local function add_shroom(name, desc, ad)

	core.register_node("ethereal:illumishroom" .. ad, {
		description = S(desc .. " Illumishroom"),
		drawtype = "plantlike",
		tiles = {"ethereal_illumishroom_" .. name .. ".png"},
		inventory_image = "ethereal_illumishroom_" .. name .. ".png",
		wield_image = "ethereal_illumishroom_" .. name .. ".png",
		paramtype = "light",
		light_source = 5,
		sunlight_propagates = true,
		walkable = false,
		groups = {dig_immediate = 3, attached_node = 1, flammable = 3},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed", fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.47, 6 / 16}
		}
	})
end

-- add illuminated cave shrooms

add_shroom("red", "Red", "")
add_shroom("green", "Green", "2")
add_shroom("cyan", "Cyan", "3")

-- poppy

core.register_node("ethereal:poppy", {
	description = S("Poppy"),
	tiles = {"ethereal_poppy.png"},
	inventory_image = "ethereal_poppy.png",
	wield_image = "ethereal_poppy.png",
	sunlight_propagates = true,
	buildable_to = true,
	waving = 1,
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	groups = {flower = 1, flora = 1, snappy = 3, attached_node = 1, flammable = 3},
	selection_box = {
		type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	sounds = default.node_sound_leaves_defaults(),
})

-- craft dye from plant
core.register_craft({ output = "dye:red 4", recipe = {{"ethereal:poppy"}} })

core.register_alias("xanadu:poppy", "ethereal:poppy")
