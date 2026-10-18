
-- register decoration helper

local function add_deco(enabled, def)

	if enabled ~= 1 then return end

	def.sidelen = def.sidelen or 16 -- some handy defaults
	def.deco_type = "simple"
	def.y_min = def.y_min or 1
	def.y_max = def.y_max or 100

	core.register_decoration(def)
end

-- old biome setting (when enabled new biomes arent available)

local old = core.settings:get_bool("ethereal.old_biomes")

-- is farming redo active

local fredo = core.get_modpath("farming") and farming.mod and farming.mod == "redo"

--= Tawny Woods biome

add_deco(ethereal.tawny_woods, { -- leaf litter
	place_on = {"ethereal:tawny_dirt", "default:dirt_with_coniferous_litter"},
	fill_ratio = 0.9, y_min = 3, y_max = 71,
	biomes = {"tawny_woods"},
	decoration = {"ethereal:leaf_litter"},
	spawn_by = "ethereal:poplar_trunk", num_spawn_by = 1, param2 = 1
})

add_deco(ethereal.tawny_woods, { -- more leaf litter
	place_on = "ethereal:tawny_dirt",
	fill_ratio = 0.6, y_min = 3, y_max = 71,
	biomes = {"tawny_woods"},
	decoration = {"ethereal:leaf_litter"},
	spawn_by = "ethereal:leaf_litter", num_spawn_by = 1, param2 = 1
})

add_deco(ethereal.tawny_woods, { -- tawny grass
	place_on = "ethereal:tawny_dirt",
	fill_ratio = 0.1, y_min = 3, y_max = 71,
	biomes = {"tawny_woods"},
	decoration = {"ethereal:tawny_grass"} })

add_deco(ethereal.tawny_woods, { -- red shrub
	place_on = "ethereal:tawny_dirt",
	fill_ratio = 0.01, y_min = 3, y_max = 71,
	biomes = {"tawny_woods"},
	decoration = {"ethereal:shrub_red"}, param2 = 10})

add_deco(ethereal.tawny_woods, { -- flowers
	place_on = "ethereal:tawny_dirt",
	fill_ratio = 0.002, y_min = 3, y_max = 71,
	biomes = {"tawny_woods"},
	decoration = {"flowers:viola", "flowers:dandelion_yellow"} })

add_deco(fredo and ethereal.tawny_woods, { -- pumpkin if farming redo active
	place_on = {"ethereal:tawny_dirt", "default:dirt_with_rainforest_litter"},
	noise_params = {offset = 0, scale = 0.009, spread = {x = 100, y = 100, z = 100},
		seed = 576, octaves = 3, persist = 0.6},
	y_min = 1, y_max = 70, biomes = {"tawny_woods"},
	decoration = "farming:pumpkin_8",
	spawn_by = {"ethereal:leaf_litter"}, num_spawn_by = 1
})

--= Magical Forest biome

add_deco(ethereal.magical_forest, { -- magical water
	place_on = {"ethereal:magical_dirt"},
	sidelen = 4, fill_ratio = 0.001, y_min = 3, y_max = 42,
	biomes = {"magical_forest"},
	flags = "force_placement",
	decoration = "ethereal:magical_water", place_offset_y = -1,
	spawn_by = "ethereal:magical_dirt", num_spawn_by = 8})

add_deco(ethereal.magical_forest, { -- magical grass
	place_on = "ethereal:magical_dirt",
	fill_ratio = 0.1, y_min = 3, y_max = 42,
	biomes = {"magical_forest"}, param2 = 3,
	decoration = {"ethereal:magical_grass"} })

add_deco(ethereal.magical_forest, { -- grass or black tulip
	place_on = "ethereal:magical_dirt",
	fill_ratio = 0.003, y_min = 3, y_max = 42,
	biomes = {"magical_forest"},
	decoration = {"flowers:tulip_black", "flowers:dandelion_white",
		"bakedclay:lazarus"} })

--= Mangrove biome

add_deco(ethereal.mangrove, { -- grass or fern
	place_on = {"ethereal:mud"},
	fill_ratio = 0.15, y_min = 1, y_max = 7,
	biomes = {"mangrove", "mangrove_shore"},
	decoration = {"default:dry_bush", "default:junglegrass", "default:grass_5",
			"default:fern_1", "default:fern_2", "default:fern_3",
			"bakedclay:mannagrass"} })

add_deco(ethereal.mangrove, { -- flower
	place_on = "ethereal:mud",
	fill_ratio = 0.002, y_min = 1, y_max = 7,
	biomes = {"mangrove", "mangrove_shore"},
	decoration = "flowers:geranium"})

--= Mesa biome

add_deco(ethereal.mesa,{ -- orange baked clay surface patches
	place_on = {"default:dirt_with_dry_grass"},
	sidelen = 2, y_min = 10, y_max = 18,
	noise_params = {offset = -1, scale = -1.25, spread = {x = 100, y = 100, z = 100},
		seed = 4, octaves = 4, persist = 1.0},
	biomes = {"mesa_redwood"},
	decoration = "bakedclay:orange", place_offset_y = -1, flags = "force_placement"})

add_deco(ethereal.mesa, { -- dry grass
	place_on = {"default:dirt_with_dry_grass"},
	fill_ratio = 0.1,
	biomes = {"mesa_redwood"},
	decoration = {"default:dry_grass_2", "default:dry_grass_3", "default:dry_grass_4",
			"default:dry_grass_5"}})

add_deco(ethereal.mesa, { -- dry shrub or barrel cactus
	place_on = {"default:desert_sand", "bakedclay:red", "bakedclay:grey",
		"bakedclay:brown", "bakedclay:orange"},
	fill_ratio = 0.002, y_min = 3,
	biomes = {"mesa_beach", "mesa"},
	decoration = {"default:dry_shrub", "ethereal:barrel_cactus"},
	spawn_by = {"group:bakedclay", "default:desert_sand"}, num_spawn_by = 8})

add_deco(ethereal.mesa, { -- cactus
	place_on = {"default:desert_sand"},
	fill_ratio = 0.0005, y_min = 3,
	biomes = {"mesa_beach"},
	decoration = "default:cactus", height_max = 2})

add_deco(ethereal.mesa, { -- pond stand-in
	place_on = {"group:bakedclay"},
	sidelen = 32, fill_ratio = 0.003, y_min = 18, y_max = 72,
	biomes = {"mesa"},
	decoration = {"ethereal:pond"},
	spawn_by = "group:bakedclay", num_spawn_by = 8})

--= Swamp biome

add_deco(ethereal.swamp, { -- water pools
	place_on = {"default:dirt_with_grass"},
	sidelen = 4, fill_ratio = 0.01, y_min = 1, y_max = 2,
	biomes = {"swamp"},
	flags = "force_placement",
	decoration = "default:water_source", place_offset_y = -1,
	spawn_by = "default:dirt_with_grass", num_spawn_by = 8})

add_deco(ethereal.swamp, { -- more water pools
	place_on = {"default:dirt_with_grass"},
	sidelen = 4, fill_ratio = 0.1, y_min = 1, y_max = 2,
	biomes = {"swamp"},
	flags = "force_placement",
	decoration = "default:water_source", place_offset_y = -1,
	spawn_by = {"default:dirt_with_grass", "default:water_source"}, num_spawn_by = 8})

add_deco(ethereal.swamp, { -- grass with chance of jungle grass or fern
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.1,
	biomes = {"swamp"},
	decoration = {"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5", "default:junglegrass", "ethereal:fern",
		"bakedclay:mannagrass"} })

add_deco(ethereal.swamp, { -- mix of mushrooms
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.02,
	biomes = {"swamp"},
	decoration = {"flowers:mushroom_brown", "flowers:mushroom_red"} })

add_deco(ethereal.swamp, { -- papyrus
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.1, y_min = 1, y_max = 1,
	biomes = {"swamp"},
	decoration = "default:papyrus", height_max = 4,
	spawn_by = "default:water_source", num_spawn_by = 1})

--= Ice-sheet biome

add_deco(ethereal.glacier, { -- firethorn shrub
	place_on = "default:snowblock",
	fill_ratio = 0.001, y_min = 1, y_max = 30,
	biomes = {"icesheet"},
	decoration = "ethereal:firethorn"})

add_deco(core.get_modpath("caverealms") and ethereal.glacier, { -- caverealms icicle
	place_on = "default:snowblock",
	fill_ratio = 0.008, y_min = 1, y_max = 30,
	biomes = {"icesheet"},
	decoration = "caverealms:icicle_up"})

--= Banana Grove biome

add_deco(ethereal.grove, { -- rainforest litter in grove biome
	place_on = {"ethereal:grove_dirt"},
	sidelen = 4,
	noise_params = {offset = -0.0025, scale = 0.5, spread = {x = 100, y = 100, z = 100},
			seed = 329, octaves = 1, persist = 1.0},
	biomes = {"grove"},
	decoration = "default:dirt_with_rainforest_litter", place_offset_y = -1,
	flags = "force_placement"
})

add_deco(ethereal.grove, { -- grass with chance of fern
	place_on = {"ethereal:grove_dirt"},
	fill_ratio = 0.1,
	biomes = {"grove"},
	decoration = {"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5", "ethereal:fern"} })

add_deco(ethereal.grove, { -- flowers
	place_on = {"ethereal:grove_dirt"},
	fill_ratio = 0.002,
	biomes = {"grove"},
	decoration = {"flowers:geranium", "flowers:tulip"} })

--= Plains biome

add_deco(ethereal.plains, { -- dry dirt patches
	place_on = {"default:dry_dirt_with_dry_grass"},
	sidelen = 4,
	noise_params = {offset = -1.5, scale = -1.5, spread = {x = 200, y = 200, z = 200},
		seed = 329, octaves = 4, persist = 1.0},
	biomes = {"plains"},
	decoration = "default:dry_dirt", place_offset_y = -1, flags = "force_placement"})

add_deco(ethereal.plains, { -- scorched tree
	place_on = "ethereal:dry_dirt",
	fill_ratio = 0.006,
	biomes = {"plains"},
	decoration = "ethereal:scorched_tree", height_max = 6})

add_deco(ethereal.plains, { -- dry shrub
	place_on = {"ethereal:dry_dirt"},
	fill_ratio = 0.015,
	biomes = {"plains"},
	decoration = "default:dry_shrub"})

add_deco(ethereal.plains, { -- flower
	place_on = "ethereal:dry_dirt",
	fill_ratio = 0.001,
	biomes = {"plains"},
	decoration = "flowers:dandelion_white"})

--= Savanna biome

add_deco(ethereal.savanna, { -- dry dirt patches
	place_on = {"default:dry_dirt_with_dry_grass"},
	sidelen = 4,
	noise_params = {offset = -1.5, scale = -1.5, spread = {x = 200, y = 200, z = 200},
		seed = 329, octaves = 4, persist = 1.0},
	biomes = {"savanna"},
	decoration = "default:dry_dirt", place_offset_y = -1,
	flags = "force_placement"
})

add_deco(ethereal.savanna, { -- dry grass
	place_on = {"default:dry_dirt_with_dry_grass", "default:dirt_with_dry_grass"},
	fill_ratio = 0.1,
	biomes = {"savanna"},
	decoration = {"default:dry_grass_2", "default:dry_grass_3", "default:dry_grass_4",
		"default:dry_grass_5"} })

add_deco(ethereal.savanna, { -- flower
	place_on = {"default:dry_dirt_with_dry_grass", "default:dirt_with_dry_grass"},
	fill_ratio = 0.002,
	biomes = {"savanna"},
	decoration = {"flowers:dandelion_yellow"} })

--= Caves biome

add_deco(ethereal.caves, {
	place_on = {"default:desert_stone"},
	fill_ratio = 0.005, y_min = 5, y_max = 42,
	biomes = {"caves"},
	decoration = {"default:dry_grass_2", "default:dry_grass_3", "default:dry_shrub"}})

--= GrassyTwo biome

add_deco(ethereal.grassytwo, {
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.1,
	biomes = {"grassytwo"},
	decoration = {"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5"} })

add_deco(ethereal.grassytwo, { -- flowers
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.002,
	biomes = {"grassytwo"},
	decoration = {"flowers:dandelion_white", "flowers:viola"} })

--= Prairie biome

add_deco(ethereal.prairie, { -- grass
	place_on = {"ethereal:prairie_dirt"},
	fill_ratio = 0.1,
	biomes = {"prairie"},
	decoration = {"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5"} })

add_deco(ethereal.prairie, { -- chance of grass, flower or strawberry
	place_on = {"ethereal:prairie_dirt"},
	fill_ratio = 0.02,
	biomes = {"prairie"},
	decoration = {"default:grass_1", "flowers:rose", "bakedclay:thistle",
		"flowers:dandelion_yellow", "flowers:viola", "ethereal:strawberry_7"} })

--= - Frost biome

add_deco(ethereal.frost, { -- crystal grass and chance of crystal spike
	place_on = {"ethereal:crystal_dirt"},
	fill_ratio = 0.05, y_min = 1, y_max = 1750,
	biomes = {"frost", "frost_floatland"},
	decoration = {"ethereal:crystalgrass", "ethereal:crystalgrass",
		"ethereal:crystalgrass", "ethereal:crystalgrass", "ethereal:crystal_spike"} })

add_deco(ethereal.frost, { -- thin ice
	place_on = {"default:silver_sand"},
	fill_ratio = 1.0, y_min = 0, y_max = 0,
	decoration = "ethereal:thin_ice", place_offset_y = 1,
	biomes = {"frost_ocean"} })

add_deco(ethereal.frost, { -- chance of something edible so high up
	place_on = {"ethereal:crystal_dirt"},
	fill_ratio = 0.002, y_min = 1025, y_max = 1750,
	biomes = {"frost_floatland"},
	decoration = "ethereal:fern"})

--= Fiery biome

add_deco(ethereal.fiery, { -- scorched tree
	place_on = {"ethereal:fiery_dirt"},
	fill_ratio = 0.000275,
	biomes = {"fiery"},
	decoration = "ethereal:scorched_tree",
	height_max = 6})

add_deco(ethereal.fiery, { -- lava pits
	place_on = {"ethereal:fiery_dirt"},
	place_offset_y = -1,
	spawn_by = "ethereal:fiery_dirt",
	num_spawn_by = 7,
	sidelen = 8,
	noise_params = {offset = 0.0125,  scale = 0.025, spread = {x = 50, y = 50, z = 50},
		seed = 909, octaves = 2, persist = 1.0},
	biomes = {"fiery"},
	decoration = "default:lava_source",
	flags = "force_placement"})

add_deco(ethereal.fiery, { -- fiery red shrub
	place_on = {"ethereal:fiery_dirt"},
	fill_ratio = 0.06,
	biomes = {"fiery"},
	decoration = "ethereal:dry_shrub"})

--= Grayness biome

add_deco(ethereal.snowy, { -- snowy grass
	place_on = {"ethereal:gray_dirt"},
	fill_ratio = 0.1,
	biomes = {"grayness"},
	decoration = {"ethereal:snowygrass"} })

add_deco(ethereal.snowy, { -- flowers
	place_on = {"ethereal:gray_dirt"},
	fill_ratio = 0.005,
	biomes = {"grayness"},
	decoration = {"flowers:chrysanthemum_green", "flowers:dandelion_white"} })

--= Cold Desert biome

add_deco(ethereal.cold_desert, { -- dry shrub or snowy grass
	place_on = {"default:silver_sand"},
	fill_ratio = 0.025,
	biomes = {"cold_desert"},
	decoration = {"default:dry_shrub", "ethereal:snowygrass"} })

add_deco(fredo and ethereal.cold_desert, { -- salt crystal if farming redo active
	place_on = "default:silver_sand",
	fill_ratio = 0.001, y_min = 4, y_max = 100,
	biomes = {"cold_desert"},
	decoration = "farming:salt_crystal"})

--= Sandstone Desert biome

add_deco(ethereal.sandstone, { -- cactus
	place_on = {"default:sandstone"},
	fill_ratio = 0.002,
	biomes = {"sandstone_desert"},
	decoration = "default:cactus", height_max = 2})

add_deco(ethereal.sandstone, { -- dry shrub
	place_on = {"default:sandstone"},
	fill_ratio = 0.015,
	biomes = {"sandstone_desert"},
	decoration = "default:dry_shrub"})

--= Desert biome

add_deco(ethereal.desert, { -- dry shrub with chance of barrel cactus or loose cobble
	place_on = {"default:desert_sand"},
	fill_ratio = 0.015,
	biomes = {"desert"},
	decoration = {"default:dry_shrub", "default:dry_shrub", "ethereal:barrel_cactus",
		"stairs:slab_desert_cobble"} })

add_deco(ethereal.desert, {
	place_on = {"default:desert_sand"},
	fill_ratio = 0.005,
	biomes = {"desert"},
	decoration = "default:cactus", height_max = 4})

--= Mushroom biome

add_deco(ethereal.mushroom, { -- spore grass
	place_on = {"ethereal:mushroom_dirt"},
	fill_ratio = 0.1,
	biomes = {"mushroom"},
	decoration = "ethereal:spore_grass"})

add_deco(ethereal.mushroom, { -- slime mold
	place_on = {"default:sand"},
	fill_ratio = 0.05, y_min = 1, y_max = 5,
	biomes = {"mushroom_ocean"},
	decoration = "ethereal:slime_mold"})

add_deco(ethereal.mushroom, { -- red and brown mushroom
	place_on = {"default:dirt_with_rainforest_litter", "default:dirt_with_grass",
		"ethereal:mushroom_dirt"},
	fill_ratio = 0.004,
	biomes = {"mushroom"},
	decoration = {"flowers:mushroom_brown", "flowers:mushroom_red"} })

--= Deciduous Forest biome

add_deco(ethereal.grassy, {
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.1,
	biomes = {"deciduous_forest"},
	decoration = {"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5"} })

add_deco(ethereal.grassy, {
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.002,
	biomes = {"deciduous_forest"},
	decoration = {"flowers:rose", "flowers:dandelion_white"} })

--= Rainforest biome

add_deco(ethereal.junglee, { -- jungle grass
	place_on = {"default:dirt_with_rainforest_litter"},
	fill_ratio = 0.1,
	biomes = {"rainforest"},
	decoration = "default:junglegrass"})

add_deco(ethereal.junglee, { -- geranium
	place_on = {"default:dirt_with_rainforest_litter"},
	fill_ratio = 0.002,
	biomes = {"rainforest"},
	decoration = "flowers:geranium"})

add_deco(ethereal.junglee, { -- papyrus
	place_on = {"default:dirt_with_rainforest_litter"},
	fill_ratio = 0.01, y_min = 1, y_max = 1,
	biomes = {"rainforest"},
	decoration = "default:papyrus", height_max = 4,
	spawn_by = "default:water_source", num_spawn_by = 1})

--= Jumble biome

add_deco(ethereal.jumble, { -- grass with chance of jungle grass
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.1,
	biomes = {"jumble"},
	decoration = {"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5", "default:junglegrass"} })

add_deco(ethereal.jumble, { -- flowers
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.002,
	biomes = {"jumble"},
	decoration = {"flowers:rose", "flowers:viola", "flowers:dandelion_white",
		"bakedclay:thistle"} })

--= Mediterranean biome

add_deco(ethereal.mediterranean, { -- grass
	place_on = {"ethereal:grove_dirt"},
	fill_ratio = 0.1,
	biomes = {"mediterranean"},
	decoration = {"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5"} })

add_deco(ethereal.mediterranean, { -- flowers
	place_on = {"ethereal:grove_dirt"},
	fill_ratio = 0.003,
	biomes = {"mediterranean"},
	decoration = {"flowers:tulip", "flowers:rose", "flowers:dandelion_yellow"} })

--= Grassland biome (always enabled)

add_deco(1, {
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.1,
	biomes = {"grassland"},
	decoration = {"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5"} })

add_deco(1, { -- poppy is in memory of RealBadAngel
	place_on = {"default:dirt_with_grass"},
	fill_ratio = 0.004,
	biomes = {"grassland"},
	decoration = {"ethereal:poppy"}})

add_deco(1, {
	place_on = {"default:sand"},
	sidelen = 4, y_min = 3, y_max = 6,
	noise_params = {offset = -0.7, scale = 3.0, spread = {x = 16, y = 16, z = 16},
			seed = 513337, octaves = 1, persist = 0.0, flags = "absvalue, eased"},
	biomes = {"grassland_dunes"},
	decoration = {"default:marram_grass_1", "default:marram_grass_2",
		"default:marram_grass_3"}})

--= Bamboo biome

add_deco(ethereal.bamboo, {
	place_on = {"ethereal:bamboo_dirt"},
	fill_ratio = 0.1,
	biomes = {"bamboo"},
	decoration = {"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5"} })

add_deco(ethereal.bamboo, { -- lilac
	place_on = {"ethereal:bamboo_dirt"},
	fill_ratio = 0.005, y_min = 3, y_max = 35,
	biomes = {"bamboo"},
	decoration = {"ethereal:lilac", "flowers:geranium"} })

--= Taiga biome

add_deco(ethereal.alpine, { -- flowers
	place_on = {"default:dirt_with_snow"},
	fill_ratio = 0.002, y_min = 5, y_max = 140,
	biomes = {"taiga"},
	decoration = {"flowers:viola", "bakedclay:delphinium"} })

add_deco(ethereal.alpine, {
	place_on = {"default:dirt_with_snow"},
	fill_ratio = 0.8, y_min = 40, y_max = 140,
	biomes = {"taiga"},
	decoration = "default:snow"})

--= Coniferous Forest biome

add_deco(ethereal.snowy, { -- snow
	place_on = {"default:dirt_with_coniferous_litter"},
	fill_ratio = 0.8, y_min = 20, y_max = 140,
	biomes = {"coniferous_forest"},
	decoration = "default:snow"})

add_deco(ethereal.snowy, {
	place_on = {"default:dirt_with_coniferous_litter"},
	fill_ratio = 0.1, y_min = 3, y_max = 100,
	biomes = {"coniferous_forest"},
	decoration = {"default:fern_1", "default:fern_2", "default:fern_3"} })

add_deco(ethereal.snowy, {
	place_on = {"default:dirt_with_coniferous_litter"},
	fill_ratio = 0.002, y_min = 3, y_max = 100,
	biomes = {"coniferous_forest"},
	decoration = "flowers:viola"})

add_deco(ethereal.snowy, { -- marram grass
	place_on = {"default:sand"},
	sidelen = 4, y_min = 3, y_max = 6,
	noise_params = {offset = -0.7, scale = 3.0, spread = {x = 16, y = 16, z = 16},
			seed = 513337, octaves = 1, persist = 0.0, flags = "absvalue, eased"},
	biomes = {"coniferous_forest_dunes"},
	decoration = {"default:marram_grass_1", "default:marram_grass_2",
		"default:marram_grass_3"} })

--= Snowy Grassland biome

add_deco(ethereal.snowy_grassland, { -- snow
	place_on = {"ethereal:cold_dirt"},
	fill_ratio = 0.8, y_min = 2, y_max = 40,
	biomes = {"snowy_grassland"},
	decoration = "default:snow"})

add_deco(ethereal.snowy_grassland, {
	place_on = {"ethereal:cold_dirt"},
	fill_ratio = 0.1, y_min = 3, y_max = 100,
	biomes = {"snowy_grassland"},
	decoration = {"default:grass_4", "default:fern_1", "default:fern_2", "default:fern_3"} })

add_deco(core.get_modpath("bakedclay") and ethereal.snowy_grassland, { -- flowers
	place_on = "ethereal:cold_dirt",
	fill_ratio = 0.002, y_min = 4, y_max = 100,
	biomes = {"snowy_grassland"},
	decoration = {"flowers:viola", "bakedclay:delphinium"} })

--= Tundra biome

add_deco(core.get_modpath("caverealms") and ethereal.tundra, { -- stone with algae
	place_on = {"default:permafrost_with_stones"},
	sidelen = 4, y_min = 3, y_max = 50,
	noise_params = {offset = -0.2, scale = 1.0, spread = {x = 100, y = 100, z = 100},
			seed = 1920, octaves = 3, persist = 0.5},
	biomes = {"tundra"},
	decoration = "caverealms:stone_with_algae", place_offset_y = -1,
	flags = "force_placement"})

add_deco(ethereal.tundra, { -- permafrost with moss
	place_on = {"default:permafrost_with_stones"},
	sidelen = 4, y_min = 2, y_max = 50,
	noise_params = {offset = -0.8, scale = 2.0, spread = {x = 100, y = 100, z = 100},
		seed = 53995, octaves = 3, persist = 1.0},
	biomes = {"tundra"},
	decoration = "default:permafrost_with_moss", place_offset_y = -1,
	flags = "force_placement"})

add_deco(ethereal.tundra, { -- snow
	place_on = {"default:permafrost_with_moss", "default:permafrost_with_stones",
		"default:stone", "default:gravel"},
	sidelen = 4, y_min = 1, y_max = 50,
	noise_params = {offset = 0, scale = 1.0, spread = {x = 100, y = 100, z = 100},
		seed = 172555, octaves = 3, persist = 1.0},
	biomes = {"tundra", "tundra_beach"},
	decoration = "default:snow"})

add_deco(ethereal.tundra, { -- chance of grass, dry shrub or flower
	deco_type = "simple",
	place_on = {"default:permafrost_with_moss"},
	fill_ratio = 0.02, y_min = 1, y_max = 50,
	biomes = {"tundra"},
	decoration = {"default:grass_1", "default:dry_shrub", "flowers:dandelion_white",
		"flowers:viola"} })

--= Coral Reef

add_deco(ethereal.reefs, {
	name = "default:corals",
	place_on = {"default:sand"},
	sidelen = 4, y_min = -8, y_max = -2,
	noise_params = {offset = -4, scale = 4, spread = {x = 50, y = 50, z = 50},
		seed = 7013, octaves = 3, persist = 0.7},
	biomes = {"desert_ocean", "savanna_ocean", "rainforest_ocean"},
	flags = "force_placement",
	decoration = {"default:coral_green", "default:coral_pink", "default:coral_cyan",
		"default:coral_brown", "default:coral_orange", "default:coral_skeleton"},
	place_offset_y = -1})

--= Kelp

add_deco(ethereal.reefs, {
	name = "default:kelp",
	place_on = {"default:sand"},
	y_min = -10, y_max = -5,
	noise_params = {offset = -0.04, scale = 0.1, spread = {x = 200, y = 200, z = 200},
		seed = 87112, octaves = 3, persist = 0.7},
	biomes = {"deciduous_forest_ocean", "sandstone_desert_ocean",
		"swamp_ocean", old and "swamp_ocean" or "snowy_grassland_ocean"},
	flags = "force_placement",
	decoration = "default:sand_with_kelp", place_offset_y = -1,
	param2 = 48, param2_max = 96})

--= Underground illumishrooms

local function add_illumishroom(low, high, nodename)

	add_deco(1, {
		place_on = {"default:stone_with_coal"},
		fill_ratio = 0.5, y_min = low, y_max = high,
		flags = "force_placement, all_floors",
		decoration = nodename})
end

add_illumishroom(-1000, -50, "ethereal:illumishroom")
add_illumishroom(-2000, -1000, "ethereal:illumishroom2")
add_illumishroom(-3000, -2000, "ethereal:illumishroom3")

--= Wild Onions

local abundant = core.settings:get_bool("ethereal.abundant_onions") ~= false

add_deco(1, {
	place_on = {"default:dirt_with_grass", "ethereal:prairie_dirt",
		"ethereal:magical_dirt"},
	fill_ratio = (abundant and 0.02 or 0.005),
	biomes = {"deciduous_forest", "grassytwo", "jumble", "prairie", "magical_forest"},
	decoration = "ethereal:onion_4"})

--= Butterflies mod

if core.get_modpath("butterflies") then

	add_deco(1, {
		name = "butterflies:butterfly",
		place_on = {"default:dirt_with_grass", "ethereal:prairie_dirt",
			"ethereal:magical_dirt"},
		fill_ratio = 0.0007, y_min = 1, y_max = 200,
		biomes = {"deciduous_forest", "grassytwo", "prairie", "jumble", "magical_forest"},
		decoration = {"butterflies:butterfly_white", "butterflies:butterfly_red",
			"butterflies:butterfly_violet"}, place_offset_y = 2})
		--spawn_by = "group:flower", num_spawn_by = 1})

	-- restart butterfly timers
	core.register_lbm({
		name = ":butterflies:butterfly_timer",
		nodenames = {"butterflies:butterfly_white", "butterflies:butterfly_red",
			"butterflies:butterfly_violet"},
		run_at_every_load = false,
		action = function(pos) core.get_node_timer(pos):start(5) end
	})
end

--= Fireflies mod

if core.get_modpath("fireflies") then

	add_deco(1, {
		name = "fireflies:firefly_low",
		place_on = {"default:dirt_with_grass", "default:dirt_with_coniferous_litter",
			"default:dirt_with_rainforest_litter", "default:dirt",
			"ethereal:prairie_dirt", "ethereal:tawny_dirt"},
		fill_ratio = 0.0007, y_min = -1, y_max = 200,
		biomes = {"deciduous_forest", "grassytwo", "coniferous_forest", "rainforest",
			"swamp", "tawny_woods"},
		decoration = "fireflies:hidden_firefly", place_offset_y = 2})

	-- restart firefly timers
	core.register_lbm({
		name = ":fireflies:firefly_timer",
		nodenames = {"fireflies:firefly", "fireflies:hidden_firefly"},
		run_at_every_load = false,
		action = function(pos) core.get_node_timer(pos):start(5) end
	})
end
