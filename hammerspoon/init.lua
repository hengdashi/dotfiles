-- local wm = require('window_management')

hs.window.animationDuration = 0
hs.window.setFrameCorrectness = true

hs.hotkey.bind({"alt", "ctrl"}, "D", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h

    win:setFrameInScreenBounds(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "F", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 3)
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h

    win:setFrameInScreenBounds(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "G", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 3 * 2)
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h

    win:setFrameInScreenBounds(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "E", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 3 * 2
    f.h = max.h

    win:setFrameInScreenBounds(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "T", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 3)
    f.y = max.y
    f.w = max.w / 3 * 2
    f.h = max.h

    win:setFrameInScreenBounds(f)
end)

function reloadConfig(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

