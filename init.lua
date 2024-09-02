FUMOS = {
    "cirno", "reimu", "cirnowhatsapp", "mikuhatsune", "saber"
}

SPECIALITEMS = {"default:snow", "default:gold_ingot", "wool:green", "wool:blue"}

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
    	{"", "farming:string ", ""},
    	{"wool:white", "wool:white", "wool:white"},
    	{"", "wool:white", ""}
    }
})
for i = 1, #FUMOS do
    minetest.register_craft({
        type = "shapeless",
        output =  "fumoplushies:" .. FUMOS[i] .. "plushie 1",
        recipe = {"fumoplushies:plushie",SPECIALITEMS[i]}
    })
end

