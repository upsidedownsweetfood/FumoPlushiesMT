FUMOS = {
    "cirno", "reimu", "marisa", "alice", "patchouli"
}

for i = 1, #FUMOS do
    minetest.register_node("fumoplushies:" .. FUMOS[i] .. "plushie", {
        description = "she looks squishy",
    drawtype = "mesh",
        mesh = "fumo" .. FUMOS[i] .. ".obj",
        tiles = {"fumo" .. FUMOS[i] .. ".png"},
        paramtype2 = "facedir",
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
        flammable = 3, wool = 1}
    })
end

