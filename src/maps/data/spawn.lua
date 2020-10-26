return {
    npc = {
        {x=6, y=6, id=1},
        {x=8, y=6, id=2},
    },
    tiles = {
        {s={4, 5}, e={4, 6}, q={19, 16}, c=false, l=2}, -- Colonna
        {s={3, 1}, e={10, 1}, q={6, 0}, c=true}, -- Top
        {s={3, 10}, e={10, 10}, q={6, 2}, c=true}, -- Bottom
        {s={3, 11}, e={10, 11}, q={6,4}, c=true}, -- Bottom
        {s={2, 2}, e={2, 9}, q={5, 1}, c=true}, -- Left
        {s={11, 2}, e={11, 9}, q={7, 1}, c=true}, -- Right
        {s={3, 2}, e={10, 9}, q={6, 1}, c=false, l=0}, -- Floor
    },
    tile = {
        {x=4, y=4, q={19, 15}, l=2}, -- sopra colonna
        {x=4, y=7, q={19, 17}, c=true}, -- sotto colonna
        {x=2, y=1, q={5,0}}, -- top left
        {x=2, y=10, q={5, 2}}, -- bottom left
        {x=2, y=11, q={5,4}}, -- bottom left
        {x=11, y=1, q={7,0}}, -- top right
        {x=11, y=10, q={7,2}}, -- bottom right
        {x=11, y=11, q={7,4}}, -- bottom right
    }
}
