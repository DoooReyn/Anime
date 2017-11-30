------------------------------------
-- Name : Anime
-- Author : Reyn
-- Date : 2017-11-14
--

local action_key_map = {
    moveto  = cc.MoveTo,
    moveby  = cc.MoveBy,
    scaleto = cc.ScaleTo,
    scaleby = cc.ScaleBy,
    fadein  = cc.FadeIn,
    fadeout = cc.FadeOut,
    fadeto  = cc.FadeTo,
    spawn   = cc.Spawn,
    rotateto= cc.RotateTo,
    rotateby= cc.RotateBy,
    hide    = cc.Hide,
    show    = cc.Show,
    place   = cc.Place,
    remove  = cc.RemoveSelf,
}

local function anime(target, animates, args)
    if not target then return end

    local function parse(aniargs)
        if not aniargs or type(aniargs) ~= 'table' or not aniargs.key then
            return nil
        end
        local key = action_key_map[aniargs.key]
        if not key then return nil end
        aniargs.val = aniargs.val or {}
        if aniargs.key == 'spawn' then
            local t = {}
            for i, v in ipairs(aniargs.val) do
                table.insert(t, parse(v))
            end
            return key:create(t)
        end
        return key:create(unpack(aniargs.val))
    end

    if not animates or 
    type(animates) ~= 'table' or 
    #animates == 0 then 
        return 
    end

    local anime_array = {}
    for _,v in ipairs(animates) do
        anime_array[#anime_array+1] = parse(v)
    end

    if #anime_array == 0 then 
        return 
    end

    local act = cc.Sequence:create(anime_array)    
    if args and type(args) == 'table' then
        if args.turns then
            act = cc.Repeat:create(act, args.turns)
        end
        if args.forever then
            act = cc.RepeatForever:create(act)
        end
    end
    
    target:runAction(act)
end


return anime
