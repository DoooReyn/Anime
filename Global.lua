cc.exports.OrderMap = function(...)
    local t = {}
    function t:push(key, val)
        t[#t+1] = {key=key,val=val}
        return t
    end
    function t:pop()
        table.remove(t, #t)
        return t
    end
    function t:get(i)
        return t[i]
    end
    local args = {...}
    if args and #args >=2 then
        for i=1, #args, 2 do
            local k,v = args[i], args[i+1]
            if k and v then
                t:push(k,v)
            end
        end
    end
    return t
end
