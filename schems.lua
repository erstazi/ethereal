
-- path to default and ethereal schematics

local path = core.get_modpath("ethereal") .. "/schematics/"
local dpath = core.get_modpath("default") .. "/schematics/"

-- load schematic tables

dofile(path .. "orange_tree.lua")
dofile(path .. "banana_tree.lua")
dofile(path .. "bamboo_tree.lua")
dofile(path .. "birch_tree.lua")
dofile(path .. "bush.lua")
dofile(path .. "waterlily.lua")
dofile(path .. "volcanom.lua")
dofile(path .. "volcanol.lua")
dofile(path .. "frosttrees.lua")
dofile(path .. "palmtree.lua")
dofile(path .. "pinetree.lua")
dofile(path .. "yellowtree.lua")
dofile(path .. "mushroomone.lua")
dofile(path .. "mushroomtwo.lua")
dofile(path .. "willow.lua")
dofile(path .. "bigtree.lua")
dofile(path .. "redwood_tree.lua")
dofile(path .. "redwood_small_tree.lua")
dofile(path .. "vinetree.lua")
dofile(path .. "sakura.lua")
dofile(path .. "igloo.lua")
dofile(path .. "lemon_tree.lua")
dofile(path .. "olive_tree.lua")
dofile(path .. "basandra_bush.lua")
dofile(path .. "desertstone_spike.lua")
dofile(path .. "desertstone_under_spike.lua")
dofile(path .. "mangrove_tree.lua")
dofile(path .. "pond.lua")
dofile(path .. "poplar_tree.lua")

-- register decoration helper

local function add_schem(enabled, def)

	if enabled ~= 1 then return end

	def.sidelen = def.sidelen or 80 -- some handy defaults
	def.deco_type = "schematic"
	def.y_min = def.y_min or 1
	def.y_max = def.y_max or 100
	def.flags = def.flags or "place_center_x, place_center_z"
	def.rotation = def.rotation or "random"

	core.register_decoration(def)
end

-- old biome setting (when enabled old heat/humidity values are used)

local old = core.settings:get_bool("ethereal.old_biomes")

-- poplar trees and fallen log

add_schem(ethereal.tawny_woods, {
	place_on = "ethereal:tawny_dirt",
	fill_ratio = 0.003, y_min = 3, y_max = 71, sidelen = 80, place_offset_y = 1,
	biomes = {"tawny_woods"},
	schematic = ethereal.poplar_tree})

add_schem(ethereal.tawny_woods, {
	place_on = "ethereal:tawny_dirt",
	fill_ratio = 0.003, y_min = 3, y_max = 71, sidelen = 80, place_offset_y = 1,
	biomes = {"tawny_woods"},
	schematic = ethereal.poplar_tree,
	replacements = {["ethereal:poplar_leaves_red"] = "ethereal:poplar_leaves_yellow"} })

add_schem(ethereal.tawny_woods, {
	place_on = "ethereal:tawny_dirt",
	fill_ratio = 0.003, y_min = 3, y_max = 71, sidelen = 80, place_offset_y = 1,
	biomes = {"tawny_woods"},
	schematic = ethereal.poplar_tree,
	replacements = {["ethereal:poplar_leaves_red"] = "ethereal:poplar_leaves_orange"} })

-- ice spikes

add_schem(ethereal.glacier, {
	place_on = "default:snowblock",
	y_min = 3, y_max = 30, noise_params = {offset = 0.00040, scale = 0.001,
		spread = vector.new(250, 250, 250), seed = 1133, octaves = 4, persist = 0.67},
	biomes = {"icesheet"},
	schematic = ethereal.desertstone_under_spike, place_offset_y = 1,
	spawn_by = "default:snowblock", num_spawn_by = 8,
	replacements = {{"default:cobble", "air"}, {"default:stone", "default:ice"}},
	flags = "place_center_x, place_center_z, force_placement"})

-- magical forest trees

add_schem(ethereal.magical_forest, {
	place_on = "ethereal:magical_dirt",
	fill_ratio = 0.002, y_min = 3, y_max = 42, sidelen = 80,
	biomes = {"magical_forest"},
	schematic = ethereal.birchtree,
	replacements = { ["ethereal:birch_leaves"] = "ethereal:birch_leaves2" } })

add_schem(ethereal.magical_forest, {
	place_on = "ethereal:magical_dirt",
	fill_ratio = 0.002, y_min = 3, y_max = 42, sidelen = 80,
	biomes = {"magical_forest"},
	schematic = ethereal.birchtree,
	replacements = { ["ethereal:birch_leaves"] = "ethereal:birch_leaves3" } })

add_schem(ethereal.magical_forest, {
	place_on = "ethereal:magical_dirt",
	fill_ratio = 0.002, y_min = 3, y_max = 42, sidelen = 80,
	biomes = {"magical_forest"},
	schematic = ethereal.birchtree,
	replacements = { ["ethereal:birch_leaves"] = "ethereal:birch_leaves4" } })

-- mangrove tree and waterlily

add_schem(ethereal.mangrove, {
	place_on = {"ethereal:mud"},
	sidelen = 80, fill_ratio = 0.023, y_min = -1, y_max = 6,
	biomes = {"mangrove", "mangrove_shore"},
	schematic = ethereal.mangrove_tree_2,
	flags = "place_center_x, place_center_z, force_placement"})

add_schem(ethereal.mangrove, {
	place_on = {"ethereal:mud"},
	sidelen = 80, fill_ratio = 0.023, y_min = 1, y_max = 6,
	biomes = {"mangrove", "mangrove_shore"},
	schematic = ethereal.mangrove_tree,
	flags = "place_center_x, place_center_z, force_placement"})

add_schem(ethereal.mangrove, {
	place_on = {"ethereal:mud"},
	sidelen = 16, fill_ratio = 0.035, y_min = 0, y_max = 0,
	biomes = {"mangrove_shore"},
	schematic = {
		size = {x = 1, y = 3, z = 1},
		data = {
			{name = "ethereal:mud", param1 = 255},
			{name = "default:water_source", param1 = 255},
			{name = "flowers:waterlily", param1 = 255},
		}
	}})

-- desertstone spike

add_schem(core.get_modpath("stairs") and ethereal.caves, {
	place_on = "default:desert_stone",
	sidelen = 16, fill_ratio = 0.01, y_min = 5, y_max = 42,
	biomes = {"caves"},
	schematic = ethereal.desertstone_spike,
	spawn_by = "default:desert_stone", num_spawn_by = 8,
	flags = "place_center_x, place_center_z, force_placement"})

-- desertstone under spike

add_schem(ethereal.caves, {
	place_on = "default:stone",
	sidelen = 16, fill_ratio = 0.01, y_min = 5, y_max = 42,
	biomes = {"caves"},
	schematic = ethereal.desertstone_under_spike,
	flags = "place_center_x, place_center_z, all_floors"})

-- igloo

add_schem(ethereal.glacier, {
	place_on = "default:snowblock",
	fill_ratio = 0.0002, y_min = 3, y_max = 30,
	biomes = {"icesheet"},
	schematic = ethereal.igloo, place_offset_y = -1,
	spawn_by = "default:snowblock", num_spawn_by = 8,
	flags = "place_center_x, place_center_z, force_placement"})

-- sakura tree

add_schem(ethereal.bamboo, {
	place_on = "ethereal:bamboo_dirt",
	fill_ratio = 0.002, y_min = 7, y_max = 35,
	biomes = {"bamboo"},
	schematic = ethereal.sakura_tree,
	spawn_by = "ethereal:bamboo_dirt", num_spawn_by = 6})

-- redwood tree

add_schem(ethereal.mesa, {
	place_on = "default:dirt_with_dry_grass",
	fill_ratio = 0.0025,
	biomes = {"mesa_redwood"},
	schematic = ethereal.redwood_tree,
	flags = "place_center_x, place_center_z",
	spawn_by = "default:dirt_with_dry_grass", num_spawn_by = 8})

add_schem(ethereal.mesa, {
	place_on = "default:dirt_with_dry_grass",
	fill_ratio = 0.0015,
	biomes = {"mesa_redwood"},
	schematic = ethereal.redwood_small_tree,
	flags = "place_center_x, place_center_z",
	spawn_by = "default:dirt_with_dry_grass", num_spawn_by = 8})

-- banana tree

add_schem(ethereal.grove, {
	place_on = "ethereal:grove_dirt",
	fill_ratio = 0.015,
	biomes = {"grove"},
	schematic = ethereal.bananatree})

-- healing tree

add_schem(1, {
	place_on = {"default:snow", "default:snowblock"},
	fill_ratio = 0.01, y_min = old and 120 or 150, y_max = old and 140 or 160,
	biomes = old and {"taiga"} or {"mountain", "icesheet"},
	schematic = ethereal.yellowtree,
	spawn_by = old and "default:dirt_with_snow" or "default:snow", num_spawn_by = 8,
	flags = "place_center_x, place_center_z, force_placement"})

-- crystal frost tree

add_schem(ethereal.frost, {
	place_on = "ethereal:crystal_dirt",
	fill_ratio = 0.01, y_min = 1, y_max = 1750,
	biomes = {"frost", "frost_floatland"},
	schematic = ethereal.frosttrees,
	spawn_by = "ethereal:crystal_dirt", num_spawn_by = 8})

-- giant red mushroom

add_schem(ethereal.mushroom, {
	place_on = "ethereal:mushroom_dirt",
	sidelen = 16,
	noise_params = {offset = 0.01, scale = 0.0075, spread = {x = 100, y = 100, z = 100},
		seed = 328, octaves = 2, persist = 0.6},
	biomes = {"mushroom"},
	schematic = ethereal.mushroomone,
	spawn_by = "ethereal:mushroom_dirt", num_spawn_by = 8})

-- giant brown mushroom

add_schem(ethereal.mushroom, {
	place_on = "ethereal:mushroom_dirt",
	sidelen = 16,
	noise_params = {offset = 0.005, scale = 0.0075, spread = {x = 100, y = 100, z = 100},
		seed = 329, octaves = 2, persist = 0.9},
	biomes = {"mushroom"},
	schematic = ethereal.mushroomtwo,
	spawn_by = "ethereal:mushroom_dirt", num_spawn_by = 6})

-- small lava crater

add_schem(ethereal.fiery, {
	place_on = "ethereal:fiery_dirt",
	fill_ratio = 0.003,
	biomes = {"fiery"},
	schematic = ethereal.volcanom,
	spawn_by = "ethereal:fiery_dirt", num_spawn_by = 8})

-- large lava crater

add_schem(ethereal.fiery, {
	place_on = "ethereal:fiery_dirt",
	fill_ratio = 0.0013,
	biomes = {"fiery"},
	schematic = ethereal.volcanol,
	spawn_by = "ethereal:fiery_dirt", num_spawn_by = 4})

-- basandra bush

add_schem(ethereal.fiery, {
	place_on = "ethereal:fiery_dirt",
	fill_ratio = 0.03,
	biomes = {"fiery"},
	schematic = ethereal.basandrabush})

-- Emergent jungle tree
-- Due to 32 node height, altitude is limited and prescence depends on chunksize

local chunksize
if core.get_mapgen_chunksize then
	local v = core.get_mapgen_chunksize()
	chunksize = math.max(v.x, v.y, v.z)
else
	chunksize = tonumber(core.get_mapgen_setting("chunksize")) or 5
end

if chunksize >= 5 then

	add_schem(ethereal.junglee, {
		name = "default:emergent_jungle_tree",
		place_on = {"default:dirt_with_rainforest_litter"},
		noise_params = {offset = 0, scale = 0.0025, spread = {x = 250, y = 250, z = 250},
			seed = 2685, octaves = 3, persist = 0.7 },
		biomes = {"rainforest"},
		y_min = 1, y_max = 32,
		schematic = dpath .. "emergent_jungle_tree.mts",
		place_offset_y = -4,
	})
end

-- default jungle tree

add_schem(ethereal.junglee, {
	place_on = "default:dirt_with_rainforest_litter",
	fill_ratio = 0.08,
	biomes = {"rainforest"},
	schematic = dpath .. "jungle_tree.mts"})

-- papyrus on dirt

add_schem(ethereal.junglee, {
	name = "default:papyrus_on_dirt",
	place_on = {"default:dirt"},
	sidelen = 16,
	noise_params = {offset = -0.3, scale = 0.7, spread = {x = 200, y = 200, z = 200},
		seed = 354, octaves = 3, persist = 0.7},
	biomes = {"rainforest_swamp"},
	y_min = 0, y_max = 0,
	schematic = {
		size = {x = 1, y = 7, z = 1},
		data = {
			{name = "default:dirt", prob = 255, force_place = true},
			{name = "default:dirt", prob = 255, force_place = true},
			{name = "default:papyrus", prob = 255},
			{name = "default:papyrus", prob = 255},
			{name = "default:papyrus", prob = 255},
			{name = "default:papyrus", prob = 255},
			{name = "default:papyrus", prob = 255},
		},
		yslice_prob = { {ypos = 2, prob = 127}, {ypos = 3, prob = 127} }
	}
})

-- papyrus on dry dirt

add_schem(ethereal.savanna, {
	name = "default:papyrus_on_dry_dirt",
	place_on = {"default:dry_dirt"},
	sidelen = 16,
	noise_params = {offset = -0.3, scale = 0.7, spread = {x = 200, y = 200, z = 200},
		seed = 354, octaves = 3, persist = 0.7},
	biomes = {"savanna_shore"},
	y_min = 0, y_max = 0,
	schematic = {
		size = {x = 1, y = 7, z = 1},
		data = {
			{name = "default:dry_dirt", prob = 255, force_place = true},
			{name = "default:dry_dirt", prob = 255, force_place = true},
			{name = "default:papyrus", prob = 255},
			{name = "default:papyrus", prob = 255},
			{name = "default:papyrus", prob = 255},
			{name = "default:papyrus", prob = 255},
			{name = "default:papyrus", prob = 255},
		},
		yslice_prob = { {ypos = 2, prob = 127}, {ypos = 3, prob = 127} }
	}
})

-- willow tree

add_schem(ethereal.grayness, {
	place_on = "ethereal:gray_dirt",
	fill_ratio = 0.01, sidelen = 16,
	biomes = {"grayness"},
	schematic = ethereal.willow,
	spawn_by = "ethereal:gray_dirt", num_spawn_by = 6})

-- default large pine tree for lower elevation

add_schem(ethereal.snowy, {
	place_on = {"default:dirt_with_coniferous_litter"},
	fill_ratio = 0.025, y_min = 4, y_max = 50,
	biomes = {"coniferous_forest"},
	schematic = dpath .. "pine_tree.mts"})

-- default small pine tree for higher elevation

add_schem(ethereal.snowy, {
	place_on = {"default:dirt_with_coniferous_litter"},
	fill_ratio = 0.025, y_min = 50, y_max = 140,
	biomes = {"coniferous_forest"},
	schematic = dpath .. "small_pine_tree.mts"})--ethereal.pinetree})

-- default large snowy pine tree for lower elevation

add_schem(ethereal.alpine, {
	place_on = {"default:dirt_with_snow"},
	fill_ratio = 0.025, y_min = 4, y_max = 50,
	biomes = {"taiga"},
	schematic = dpath .. "snowy_pine_tree_from_sapling.mts"})

-- default small snowy pine for higher elevation

add_schem(ethereal.snowy, {
	place_on = {"default:dirt_with_snow"},
	fill_ratio = 0.025, y_min = 50, y_max = 140,
	biomes = {"taiga"},
	schematic = dpath .. "snowy_small_pine_tree_from_sapling.mts"})--ethereal.pinetree})

-- default apple tree

add_schem(ethereal.grassy, {
	place_on = "default:dirt_with_grass",
	fill_ratio = 0.025,
	biomes = {"jumble", "deciduous_forest"},
	schematic = dpath .. "apple_tree.mts"})

-- big old tree

add_schem(ethereal.jumble, {
	place_on = "default:dirt_with_grass",
	fill_ratio = 0.001,
	biomes = {"jumble"},
	schematic = ethereal.bigtree,
	spawn_by = "default:dirt_with_grass", num_spawn_by = 8})

-- default aspen tree

add_schem(ethereal.grassytwo, {
	place_on = "default:dirt_with_grass",
	fill_ratio = 0.02, y_min = 1, y_max = 50,
	biomes = {"grassytwo"},
	schematic = dpath .. "aspen_tree.mts"})

-- birch tree

add_schem(ethereal.grassytwo, {
	place_on = "default:dirt_with_grass",
	fill_ratio = 0.02, y_min = 50, y_max = 100,
	biomes = {"grassytwo"},
	schematic = ethereal.birchtree})

-- orange tree

add_schem(ethereal.prairie, {
	place_on = "ethereal:prairie_dirt",
	fill_ratio = 0.01, place_offset_y = 1,
	biomes = {"prairie"},
	schematic = ethereal.orangetree})

-- farming redo's kiwi tree

local mod_fredo = core.get_modpath("farming") and farming.mod and farming.mod == "redo"

add_schem(mod_fredo and farming.kiwi ~= 0 and ethereal.prairie, {
	place_on = "ethereal:prairie_dirt",
	fill_ratio = 0.001,
	biomes = {"prairie"},
	schematic = farming.kiwi_vine, place_offset_y = 1,
	spawn_by = {"ethereal:prairie_dirt"}, num_spawn_by = 8
})

-- default acacia tree

add_schem(ethereal.savanna, {
	place_on = {"default:dry_dirt_with_dry_grass", "default:dirt_with_dry_grass"},
	fill_ratio = 0.004,
	biomes = {"savanna"},
	schematic = dpath .. "acacia_tree.mts"})

-- palm tree

add_schem(1, {
	place_on = {"default:sand", "default:desert_sand"},
	fill_ratio = 0.0025, y_min = 1, y_max = 2, place_offset_y = 1,
	biomes = {"desert_ocean", "plains_ocean", "sandstone_desert_ocean",
			"mesa_beach", "grove_ocean", "deciduous_forest_shore"},
	schematic = ethereal.palmtree})

-- bamboo tree

add_schem(ethereal.bamboo, {
	place_on = "ethereal:bamboo_dirt",
	fill_ratio = 0.025, y_min = 36, y_max = 70,
	biomes = {"bamboo"},
	schematic = ethereal.bambootree})

-- bush

add_schem(ethereal.bamboo, {
	place_on = "ethereal:bamboo_dirt",
	fill_ratio = 0.08, y_min = 35, y_max = 70,
	biomes = {"bamboo"},
	schematic = ethereal.bush,
	spawn_by = "ethereal:bamboo_dirt", num_spawn_by = 6})

-- vine tree

add_schem(ethereal.swamp, {
	place_on = "default:dirt_with_grass",
	fill_ratio = 0.02,
	biomes = {"swamp"},
	schematic = ethereal.vinetree})

-- lemon tree

add_schem(ethereal.mediterranean, {
	place_on = "ethereal:grove_dirt",
	fill_ratio = 0.004, y_min = 5, y_max = 50,
	biomes = {"mediterranean"},
	schematic = ethereal.lemontree})

-- olive tree

add_schem(ethereal.mediterranean, {
	place_on = "ethereal:grove_dirt",
	fill_ratio = 0.004, y_min = 5, y_max = 45,
	biomes = {"mediterranean"},
	schematic = ethereal.olivetree})

-- default large cactus

add_schem(ethereal.desert, {
	place_on = {"default:desert_sand"},
	y_min = 5, y_max = 100,
	noise_params = {
		offset = -0.0005, scale = 0.0015, spread = {x = 200, y = 200, z = 200},
		seed = 230, octaves = 3, persist = 0.6},
	biomes = {"desert"},
	schematic = dpath .. "large_cactus.mts",
	flags = "place_center_x"})

-- default bush

add_schem(1, {
	place_on = {"default:dirt_with_grass", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = -0.004, scale = 0.01, spread = {x = 100, y = 100, z = 100},
		seed = 137, octaves = 3, persist = 0.7},
	biomes = {"deciduous_forest", "grassytwo", "jumble"},
	schematic = dpath .. "bush.mts"})

-- default acacia bush

add_schem(1, {
	place_on = {"default:dirt_with_dry_grass", "default:dry_dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.004, scale = 0.01, spread = {x = 100, y = 100, z = 100},
		seed = 90155, octaves = 3, persist = 0.7},
	biomes = {"savanna", "mesa"},
	schematic = dpath .. "acacia_bush.mts"})

-- default pine bush

add_schem(1, {
	name = "default:pine_bush",
	place_on = {"default:dirt_with_snow", "ethereal:cold_dirt"},
	sidelen = 16, y_min = 4, y_max = 120,
	noise_params = {
		offset = -0.004, scale = 0.01, spread = {x = 100, y = 100, z = 100},
		seed = 137, octaves = 3, persist = 0.7},
	biomes = {"taiga", "snowy_grassland"},
	schematic = dpath .. "pine_bush.mts"})

-- default blueberry bush

add_schem(1, {
	name = "default:blueberry_bush",
	place_on = {"default:dirt_with_grass", "default:dirt_with_snow", "ethereal:cold_dirt"},
	sidelen = 16,
	noise_params = {
		offset = -0.004, scale = 0.01, spread = {x = 100, y = 100, z = 100},
		seed = 697, octaves = 3, persist = 0.7},
	biomes = {"grassland", "snowy_grassland"},
	schematic = dpath .. "blueberry_bush.mts", place_offset_y = 1})

-- place waterlily in beach areas

add_schem(1, {
	place_on = {"default:sand", "default:desert_sand", "default:dirt"},
	sidelen = 16, y_min = 0, y_max = 0,
	noise_params = {
		offset = -0.12, scale = 0.3, spread = {x = 200, y = 200, z = 200},
		seed = 33, octaves = 3, persist = 0.7},
	biomes = {"desert_ocean", "plains_ocean", "mesa_beach", "grove_ocean",
			"deciduous_forest_shore", "swamp_ocean"},
	schematic = ethereal.waterlily})

-- coral reef

if ethereal.reefs == 1 then

	-- override corals so crystal shovel can pick them up intact
	core.override_item("default:coral_skeleton", {groups = {crumbly = 3}})
	core.override_item("default:coral_orange", {groups = {crumbly = 3}})
	core.override_item("default:coral_brown", {groups = {crumbly = 3}})

	add_schem(1, {
		place_on = {"default:sand"},
		noise_params = {
			offset = -0.15, scale = 0.1, spread = {x = 100, y = 100, z = 100},
			seed = 7013, octaves = 3, persist = 1},
		biomes = {"desert_ocean", "grove_ocean"},
		y_min = -8, y_max = -2,
		schematic = path .. "corals.mts"})
end

-- tree logs

if ethereal.logs == 1 then

	add_schem(ethereal.tawny_woods, {
		name = "ethereal:poplar_trunk",
		place_on = {"ethereal:tawny_dirt"},
		fill_ratio = 0.0018, y_min = 3, y_max = 71,
		biomes = {"tawny_woods"},
		schematic = {
			size = {x = 3, y = 1, z = 1},
			data = {
				{name = "ethereal:poplar_trunk", param1 = 255, param2 = 16},
				{name = "ethereal:poplar_trunk", param1 = 255, param2 = 16},
				{name = "ethereal:poplar_trunk", param1 = 201, param2 = 16}
			}
		}, place_offset_y = 1,
		flags = "place_center_x",
		spawn_by = "ethereal:tawny_dirt", num_spawn_by = 8})

	add_schem(ethereal.prairie, {
		name = "default:apple_log",
		place_on = {"default:dirt_with_grass", "ethereal:prairie_dirt"},
		sidelen = 16, fill_ratio = 0.001,
		biomes = {"deciduous_forest", "jumble", "swamp", "prairie"},
		schematic = dpath .. "apple_log.mts", place_offset_y = 1,
		flags = "place_center_x",
		spawn_by = {"default:dirt_with_grass", "ethereal:prairie_dirt"}, num_spawn_by = 8})

	add_schem(ethereal.junglee, {
		name = "default:jungle_log",
		place_on = {"default:dirt_with_rainforest_litter"},
		fill_ratio = 0.005,
		biomes = {"rainforest"},
		schematic = dpath .. "jungle_log.mts", place_offset_y = 1,
		flags = "place_center_x",
		spawn_by = "default:dirt_with_rainforest_litter", num_spawn_by = 8})

	add_schem(ethereal.snowy, {
		name = "default:pine_log",
		place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
		fill_ratio = 0.0018, y_min = 4, y_max = 100,
		biomes = {"taiga", "coniferous_forest"},
		schematic = dpath .. "pine_log.mts", place_offset_y = 1,
		flags = "place_center_x",
		spawn_by = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
		num_spawn_by = 8})

	add_schem(ethereal.savanna, {
		name = "default:acacia_log",
		place_on = {"default:dry_dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0, scale = 0.001, spread = {x = 250, y = 250, z = 250},
			seed = 2, octaves = 3, persist = 0.66},
		biomes = {"savanna"},
		schematic = dpath .. "acacia_log.mts", place_offset_y = 1,
		flags = "place_center_x",
		spawn_by = "default:dry_dirt_with_dry_grass", num_spawn_by = 8})

	add_schem(ethereal.plains, {
		name = "ethereal:scorched_log",
		place_on = {"ethereal:dry_dirt"},
		fill_ratio = 0.0018, y_min = 4, y_max = 100,
		biomes = {"plains"},
		schematic = {
			size = {x = 3, y = 1, z = 1},
			data = {
				{name = "ethereal:scorched_tree", param1 = 201, param2 = 16},
				{name = "ethereal:scorched_tree", param1 = 255, param2 = 16},
				{name = "ethereal:scorched_tree", param1 = 255, param2 = 16}
			}
		}, place_offset_y = 1,
		flags = "place_center_x",
		spawn_by = "ethereal:dry_dirt", num_spawn_by = 8})

	add_schem(ethereal.grove, {
		name = "ethereal:banana_log",
		place_on = {"ethereal:grove_dirt"},
		fill_ratio = 0.0018, y_min = 4, y_max = 100,
		biomes = {"grove"},
		schematic = {
			size = {x = 3, y = 1, z = 1},
			data = {
				{name = "ethereal:banana_trunk", param1 = 255, param2 = 16},
				{name = "ethereal:banana_trunk", param1 = 255, param2 = 16},
				{name = "ethereal:banana_trunk", param1 = 201, param2 = 16}
			}
		}, place_offset_y = 1,
		flags = "place_center_x",
		spawn_by = "ethereal:grove_dirt", num_spawn_by = 8})
end

-- deep see fumarole / vent

add_schem(core.get_modpath("nether") and 1, {
	name = "nether:fumarole",
	place_on = {"default:sand"},
	sidelen = 16, y_min = -192, y_max = -45,
	fill_ratio = 0.0001,
	schematic = {
		size = {x = 1, y = 2, z = 2},
		data = {
			{name = "default:lava_source", param1 = 255, force_place = true},
			{name = "nether:fumarole", param1 = 255, force_place = true},
			{name = "default:sand", param1 = 192, force_place = true},
			{name = "ethereal:sandy", param1 = 192, force_place = true},
		}
	},
	place_offset_y = -1,
	spawn_by = {"default:water_source"}, num_spawn_by = 8})

if core.get_modpath("nether") then

	core.register_lbm({
		name = ":nether:extra_fumarole_timer",
		nodenames = {"nether:fumarole"},
		run_at_every_load = false,
		action = function(pos) core.get_node_timer(pos):start(10) end
	})
end
