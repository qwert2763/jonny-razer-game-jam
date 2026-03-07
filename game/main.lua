https = nil
local overlayStats = require("lib.overlayStats")
local runtimeLoader = require("runtime.loader")

function love.load()
  https = runtimeLoader.loadHTTPS()
  -- Your game load here
  test = love.graphics.newImage("test.png")
  love.graphics.setNewFont(12)
  love.graphics.setColor(0,0,0)
  love.graphics.setBackgroundColor(255,255,255)
  overlayStats.load() -- Should always be called last
  playerx = 50 -- ok im like assigning the variables i think idk ive only used pythion
  playery = 50
  speed = 200
  Q = love.graphics.newImage("Q.png")
end

function love.draw()
  -- Your game draw here

  love.graphics.draw(test, playerx, playery)
  love.graphics.print("i dont know how to use love2d help", 400, 100)
  love.graphics.print("wait this isnt as hard as i thought nvm", 450, 160)
  love.graphics.draw(Q, 750, 750)

  overlayStats.draw() -- Should always be called last
end

function love.update(dt)
  -- Your game update here
  if shift_down then
    speed = 400
  else
    speed = 200
  end
  if w_down then
    playery = playery - speed * dt
  end
  if s_down then
    playery = playery + speed * dt
  end
  if a_down then
    playerx = playerx - speed * dt
  end
  if d_down then
    playerx = playerx + speed * dt
  end
  overlayStats.update(dt) -- Should always be called last
end

function love.keypressed(key)
  if key == "escape" and love.system.getOS() ~= "Web" then
    love.event.quit()
  else
  if key == "w" or key == "up" then
    w_down = true
  end
  if key == "a" or key == "left" then
    a_down = true
  end
  if key == "s" or key == "down" then
    s_down = true
  end
  if key == "d" or key == "right" then
    d_down = true
  end
  if key == "rshift" or key == "lshift" then
    shift_down = true
  end
  if key == "c" then
    crash = crash + 1 -- this mskes the game crash if you press c
    print("it worked but the crash code didnt") -- i only leave comments for really stupid reasons
  end
    overlayStats.handleKeyboard(key) -- Should always be called last
  end
end

function love.keyreleased(key)
   if key == 'w' or key == "up" then
      w_down = false
   end
  if key == "a" or key == "left" then
    a_down = false
  end
  if key == 's' or key == "down" then
      s_down = false
   end
  if key == "d" or key == "right" then
    d_down = false
  end
  if key == "rshift" or key == "lshift" then
    shift_down = false
  end
end

function love.touchpressed(id, x, y, dx, dy, pressure)
  overlayStats.handleTouch(id, x, y, dx, dy, pressure) -- Should always be called last
end
