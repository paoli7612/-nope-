function Parameter(max)
    local parameter = {}

    local max = max
    local tot = max

    function parameter.get()
        return tot
    end

    function parameter.add(v)
        tot = tot + v
        if tot > max then
            tot = max
        end
    end

    function parameter.rem(v)
        tot = tot - v
        return tot > 0
    end

    function parameter.text()
        return tot .. "/" .. max
    end

    return parameter
end

return Parameter
