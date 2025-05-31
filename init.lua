FUMOS = {
	"cirno", "reimu", "cirnowhatsapp", "mikuhatsune", "saber"
}

if core.get_modpath("mcl_core") ~= nil and 
	core.get_modpath("mcl_throwing") ~= nil and 
	core.get_modpath("mcl_wool") ~= nil and 
	core.get_modpath("mcl_mobitems") ~= nil then
	WOOL_WHITE = "mcl_wool:white"
	WOOL_GREEN = "mcl_wool:green"
	WOOL_BLUE = "mcl_wool:blue"
	SNOW = "mcl_throwing:snowball"
	GOLD_INGOT = "mcl_core:gold_ingot"
	STRING = "mcl_mobitems:string"
elseif core.get_modpath("default") ~= nil then
	WOOL_WHITE = "wool:white"
	WOOL_GREEN = "wool:green"
	WOOL_BLUE = "wool:blue"
	SNOW = "default:snow"
	GOLD_INGOT = "default:gold_ingot"
	STRING = "farming:string"
else
	error("'default' (Minetest Game) or 'mineclone2' (VoxeLibre) is required for this mod!")
end


SPECIALITEMS = {SNOW, GOLD_INGOT, WOOL_GREEN, WOOL_BLUE}

minetest.register_craftitem("fumoplushies:plushie", {
	description = "A base for a fumo",
	inventory_image = "fumobaseitem.png"
})

for i = 1, #FUMOS do
	minetest.register_node("fumoplushies:" .. FUMOS[i] .. "plushie", {
		description = "she looks squishy",
	drawtype = "mesh",
		mesh = "fumo" .. FUMOS[i] .. ".obj",
		tiles = {"fumo" .. FUMOS[i] .. ".png"},
		paramtype2 = "facedir",
		paramtype = "light",
		sunlight_propagates = true,
		use_texture_alpha = "clip",
		selection_box = {
			type= "fixed",
			fixed = {-0.3, -0.46, -0.4, 0.3, 0.3, 0.3}
		},
		collision_box = {
			type = "fixed",
			fixed = {-0.3, -0.46, -0.4, 0.3, 0.3, 0.3}
		},
		is_ground_content = false,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
		flammable = 3, wool = 1},
	})
end

-------------------------------------------------------------------------

minetest.register_craft({
	output =  "fumoplushies:plushie 1",
	recipe = {
		{"", STRING, ""},
		{WOOL_WHITE, WOOL_WHITE, WOOL_WHITE},
		{"", WOOL_WHITE, ""}
	}
})

for i = 1, #FUMOS do
	minetest.register_craft({
		type = "shapeless",
		output =  "fumoplushies:" .. FUMOS[i] .. "plushie 1",
		recipe = {"fumoplushies:plushie", SPECIALITEMS[i]}
	})
end

