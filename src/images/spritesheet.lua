function Spritesheet(boss)
    local spritesheet = {}
    local image = love.graphics.newImage('images/npc.png')

    function get_quad(x, y)
        return love.graphics.newQuad(x*32, y*32, 32, 32, image:getDimensions())
    end

    function spritesheet.draw(x, y, quad)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(image, quad, x, y, 0) -- correct for float to int
    end

    function spritesheet.quads_npc(x, y)
        x = x*3
        y = y*4
        local quads = {}
        quads["down"] = {}
        quads["down"]["stand"] = {get_quad(1+x,0+y), get_quad(1+x,0+y)}
        quads["down"]["walk"] = {get_quad(0+x,0+y), get_quad(2+x,0+y)}
        quads["right"] = {}
        quads["right"]["stand"] = {get_quad(1+x,2+y), get_quad(1+x,2+y)}
        quads["right"]["walk"] = {get_quad(0+x,2+y),get_quad(2+x,2+y)}
        quads["left"] = {}
        quads["left"]["stand"] = {get_quad(1+x,1+y), get_quad(1+x,1+y)}
        quads["left"]["walk"] = {get_quad(0+x,1+y),get_quad(2+x,1+y)}
        quads["up"] = {}
        quads["up"]["stand"] = {get_quad(1+x,3+y), get_quad(1+x,3+y)}
        quads["up"]["walk"] = {get_quad(0+x,3+y),get_quad(2+x,3+y)}
        return quads
    end

    return spritesheet
end

return Spritesheet
