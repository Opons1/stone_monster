
-- translation and custom stone monster types

local S = minetest.get_translator("mobs_stone_monster")



--basic stone monster
local function register_stone_monster(data)
mobs:register_mob(data.name, {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = data.reach or 2,
	damage = data.damage or 4,
	hp_min = data.hp_min or 15,
	hp_max = data.hp_max or 40,
	armor = data.armor or 80,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.b3d",
	textures = {{data.texture or "mobs_stone_monster.png"}},
	makes_footstep_sound = true,
	sounds = {random = "mobs_stonemonster"},
	walk_velocity = data.walk_velocity or 1,
	run_velocity = data.run_velocity or 3,
	jump_height = data.jump_height or 0,
	stepheight = data.stepheight or 1.1,
	floats = 0,
	view_range = data.view_range or 10,
	drops = data.drops or {
		{name = "default:cobble", chance = 1, min = 0, max = 2},
		{name = "default:coal_lump", chance = 3, min = 0, max = 2},
		{name = "default:iron_lump", chance = 5, min = 0, max = 2}
	},
	water_damage = data.water_damage or 1,
	lava_damage = data.lava_damage or 1,
	light_damage = data.light_damage or 0,
	animation = {
		speed_normal = 15, speed_run = 15,
		stand_start = 0, stand_end = 14,
		walk_start = 15, walk_end = 38,
		run_start = 40, run_end = 63,
		punch_start = 40, punch_end = 63
	},
	immune_to = data.immune_to or {
		{"default:pick_wood", 0}, -- wooden pick doesnt hurt stone monster
		{"default:pick_stone", 4}, -- picks deal more damage to stone monster
		{"default:pick_bronze", 5},
		{"default:pick_steel", 5},
		{"default:pick_mese", 6},
		{"default:pick_diamond", 7}
	},
})

mobs:spawn({
	name = data.name or "mobs:stone_monster",
	nodes = data.spawn_nodes or {"default:stone"},
	max_light = data.max_light or 7,
	chance = data.chance or 100,
	max_height = data.max_height or -400,
})
if core.global_exists("asm") then
	asm.addEgg({
		name = data.name:split(":")[2],
		title = S(data.title or "Stone Monster"),
		inventory_image = data.inventory_image or "default_stone.png",
		spawn = data.name or "mobs:stone_monster",
		ingredients = data.ingredients or "default:stone",
	})
end
end
--Stone monsters
register_stone_monster({
	title = "Stone Monster",
	name = "mobs:stone_monster",
	texture = "mobs_stone_monster.png",
	hp_min = 20,
	hp_max = 40,
	damage = 2,
    walk_velocity = 1,
    run_velocity = 3,
})
--stronger stone monster
register_stone_monster({
	chance = 200, -- rarer than regular stone monster
	title = "Strong Stone Monster",
	name = "mobs:strong_stone_monster",
	texture = "mobs_stone_monster2.png",
	hp_min = 40,
	hp_max = 80,
	damage = 3,
	walk_velocity = 1,
	run_velocity = 2,
	drops = {
		{name = "default:cobble", chance = 1, min = 0, max = 4},
		{name = "default:coal_lump", chance = 2, min = 0, max = 4},
		{name = "default:iron_lump", chance = 3, min = 0, max = 4},
		{name = "default:diamond", chance = 10, min = 0, max = 1}
	},
	lava_damage = 0, -- strong stone monster is immune to lava
	inventory_image = "default_stone.png^[colorize:#4a4a4a:200",
	ingredients = {"default:stone", "default:obsidian"},
	spawn_nodes = {"default:stone", "default:obsidian"},
	max_height = -1000,
})
--desert sand monster?
register_stone_monster({
	title = "Desert Sandstone Monster",
	name = "mobs:desert_sandstone_monster",
	texture = "mobs_stone_monster4.png",
	hp_min = 15,
	hp_max = 30,
	damage = 2,
	walk_velocity = 1.5,
	run_velocity = 2.5,
	drops = {
		{name = "default:sand", chance = 1, min = 0, max = 4},
		{name = "default:desert_sand", chance = 2, min = 0, max = 4},
		{name = "default:coal_lump", chance = 3, min = 0, max = 4},
		{name = "default:iron_lump", chance = 5, min = 0, max = 4}
	},
	inventory_image = "default_desert_sandstone.png",
	ingredients = {"default:sand", "default:desert_sand"},
	spawn_nodes = {"default:sand", "default:desert_sand", "default:sandstone", "default:desert_sandstone"},
	max_height = -200,
})
register_stone_monster({
	name = "mobs:headless_stone_lava_monster",
	texture = "mobs_stone_monster3.png",
	hp_min = 30,
	hp_max = 60,
	damage = 7,
	walk_velocity = 2,
	run_velocity = 4,
	drops = {
		{name = "default:obsidian", chance = 1, min = 0, max = 4},
		{name = "default:coal_lump", chance = 2, min = 0, max = 4},
		{name = "default:iron_lump", chance = 3, min = 0, max = 4},
		{name = "default:diamond", chance = 5, min = 0, max = 2}
	},
	lava_damage = 0, -- headless stone lava monster is immune to lava
	inventory_image = "default_lava.png^[colorize:#4a4a4a:200",--stone-like lava texture
	ingredients = {"default:obsidian", "default:lava_source"},
	spawn_nodes = {"default:stone"},
	neighbors = {"default:lava_source"},
	max_height = -100,
	title = "Headless Stone Lava Monster"

})
-- where to spawn
mobs:alias_mob("mobs_monster:stone_monster", "mobs:stone_monster") -- compatibility
