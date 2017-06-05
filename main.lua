function love.load()
----[[
    screen_width = love.graphics.getWidth() -- screen width
    screen_width_fraction = screen_width/10 -- 1/10 screen width

    screen_height=love.graphics.getHeight() -- screen height
    screen_height_fraction = screen_height/10 -- 1/10 screen height
----]]

    --button
    movement_buttons = { -- buttons for up, left, down, right movements
        t = {screen_width_fraction*1.33, screen_height_fraction*5.49, screen_width_fraction*0.43, screen_height_fraction, 0}, -- top    
        l = {screen_width_fraction*1/4, screen_height_fraction*7, screen_width_fraction*0.8, screen_height_fraction*1/2, 0}, -- left (left edge, top edge, width, height, timer)
        b = {screen_width_fraction*1.33, screen_height_fraction*8, screen_width_fraction*0.43, screen_height_fraction, 0}, -- bottom
        r = {screen_width_fraction*2, screen_height_fraction*7, screen_width_fraction*0.8, screen_height_fraction*1/2, 0} -- right
    }
    --button

    --button delay between clicks
    freq = 0.25 -- how many seconds until "button" can be pressed again, also visual aid
    --button delay between clicks

    --player load
    player = { screen_width/2, screen_height/2, love.graphics.newImage("pat.png") }
    --player load
end

function love.update(dt)
    for i,v in pairs(movement_buttons) do
        if v[5] > 0 then
        movement_buttons[i][5] = v[5] - dt
        else
        movement_buttons[i][5] = 0
        end
    end
end

function love.draw()
    -- draw buttons
    for i,v in pairs(movement_buttons) do 
        opacity = 100 + v[5] * 400 -- change opacity over time to indicate
        love.graphics.setColor(255,255,255,opacity)
        love.graphics.rectangle("fill",v[1],v[2],v[3],v[4])
    end


    -- sample player
    love.graphics.setColor(255,255,255)
    love.graphics.draw(player[3],player[1],player[2],0,1,1,40,40)
    -- sample player
end
----[[
function love.mousepressed(mx, my)
    for i,v in pairs (movement_buttons) do
        -- checks collision and adds a repeat clicking restriction/delay
        if mx >= v[1] and mx <= v[1]+v[3] and my >= v[2] and my <= v[2] + v[4] and v[5] == 0 then
            movement_buttons[i][5] = freq
            if i == "t" then 
                -- up arrow
                player[2] = player[2] - 10
            elseif i == "l" then
                -- left arrow
                player[1] = player[1] - 10
            elseif i == "b" then
                -- down arrow
                player[2] = player[2] + 10
            elseif i == "r" then
                -- right arrow
                player[1] = player[1] + 10
            end
        end
    end
end
----]]
