size = 32

function Spritesheet(bos)
    local spritesheet = {
        quads = {}
    }
    local image = love.graphics.newImage("img/npc.png")

    function get_quad(x, y)
        return love.graphics.newQuad(x*size, y*size, size, size, image:getDimensions())
    end

    function get_npc(x, y)
        local quads = {}
        quads["down"] = {}
        quads["down"]["stand"] = {get_quad(1+x,0+y)}
        quads["down"]["walk"] = {get_quad(0+x,0+y),get_quad(2+x,0+y)}
        quads["right"] = {}
        quads["right"]["stand"] = {get_quad(1+x,2+y)}
        quads["right"]["walk"] = {get_quad(0+x,2+y),get_quad(2+x,2+y)}
        quads["left"] = {}
        quads["left"]["stand"] = {get_quad(1+x,1+y)}
        quads["left"]["walk"] = {get_quad(0+x,1+y),get_quad(2+x,1+y)}
        quads["up"] = {}
        quads["up"]["stand"] = {get_quad(1+x,3+y)}
        quads["up"]["walk"] = {get_quad(0+x,3+y),get_quad(2+x,3+y)}
        return quads
    end

    spritesheet.quads = get_npc(0, 0)

    function spritesheet.draw(sprite)
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(image, spritesheet.quads[sprite.dir][sprite.action][1], sprite.x, sprite.y)
    end

    return spritesheet
end

return Spritesheet
