f = false
t = true
return {
    npc = {
        -- NPC --
        {x=6, y=6, id=1},
        {x=8, y=6, id=2},
        -- NPC --
    },
    tiles = {
        -- TILES --
        {s={0,0}, e={30,15}, q={22,5}, c=f, l=0}, -- Floor2
        {s={3,2}, e={10,9}, q={6,1}, c=f, l=1}, -- Floor1
        {s={4,5}, e={4,6}, q={19,16}, c=f, l=2}, -- Colonna
        {s={3,1}, e={10,1}, q={6,0}, c=t, l=0}, -- Top
        {s={3,10}, e={10,10}, q={6,2}, c=t, l=0}, -- Bottom
        {s={3,11}, e={10,11}, q={6,4}, c=t, l=0}, -- Bottom
        {s={2,2}, e={2,9}, q={5,1}, c=t, l=0}, -- Left
        {s={11,2}, e={11,9}, q={7,1}, c=t, l=0}, -- Right
        -- TILES --
    },
    tile = {
        -- TILE --
        {x=4, y=4, q={20,12}, l=2}, -- sopra colonna
        {x=4, y=7, q={19,17}, c=t}, -- sotto colonna
        {x=2, y=1, q={5,0}}, -- top left
        {x=2, y=10, q={5,2}}, -- bottom left
        {x=2, y=11, q={5,4}}, -- bottom left
        {x=11, y=1, q={7,0}}, -- top right
        {x=11, y=10, q={7,2}}, -- bottom right
        {x=11, y=11, q={7,4}}, -- bottom right
        -- TILE --
    }
}
