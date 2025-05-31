local gears = require('gears')
local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup')
require('awful.hotkeys_popup.keys')
local beautiful = require('beautiful')
require('settings')

modkey = "Mod4"

globalkeys = gears.table.join(

    -- Core
    awful.key({ modkey }, 'k', 
        hotkeys_popup.show_help, 
        {description = 'keybindings', group = 'awesome'}),

    awful.key({ modkey, 'Control' }, 'Delete', 
        awesome.restart,
        {description = 'reload awesome"', group = 'awesome'}),

    awful.key({ modkey, 'Control' }, 'End',
        awesome.quit,
        {description = 'quit awesome', group = 'awesome'}),

    awful.key({ modkey }, 'a',
        function()
            if start_menu.visible then
                start_menu.visible = false
                start_button_container.shape = gears.shape.rectangle,
                start_button_container:emit_signal("widget::updated")
            else
                start_menu.visible = true
                start_button_container.shape = gears.shape.circle,
                start_button_container:emit_signal("widget::updated")
            end
        end,
        {description = 'toggle start menu', group = 'awesome'}),

    -- Window manipulation
    awful.key({ modkey }, 'Right', 
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = 'focus next window', group = 'windows'}),

    awful.key({ modkey }, 'Left',
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = 'focus previous window', group = 'windows'}),

    awful.key({ modkey, 'Shift' }, 'Right',
        function ()
            awful.client.swap.byidx(1)
        end,
        {description = 'swap with next window', group = 'windows'}),

    awful.key({ modkey, 'Shift' }, 'Left',
        function () awful.client.swap.byidx( -1)    end,
              {description = 'swap with previous window', group = 'windows'}),

    awful.key({ modkey, 'Control' }, 'Right',
        function () 
            awful.tag.incmwfact( 0.05)
        end,
        {description = 'grow window', group = 'windows'}),

    awful.key({ modkey, 'Control' }, 'Left',
        function () 
            awful.tag.incmwfact(-0.05)          
        end,
        {description = 'shrink window', group = 'windows'}),

    awful.key({ modkey, 'Shift' }, 'Up',
        function ()
            awful.tag.incnmaster( 1, nil, true)
        end,
        {description = 'increase the number of master windows', group = 'windows'}),

    awful.key({ modkey, 'Shift' }, 'Down',
        function ()
            awful.tag.incnmaster(-1, nil, true) 
        end,
        {description = 'decrease the number of master windows', group = 'windows'}),

    awful.key({ modkey, 'Shift' }, '=', 
        function ()
            awful.tag.incncol( 1, nil, true)
        end,
        {description = 'increase the number of columns', group = 'windows'}),

    awful.key({ modkey, 'Shift' }, '-',
        function () 
            awful.tag.incncol(-1, nil, true)
        end,
        {description = 'decrease the number of columns', group = 'windows'}),

    awful.key({ modkey, 'Shift' }, 'f',
        awful.client.floating.toggle,
        {description = 'toggle floating', group = 'windows'}),

    awful.key({ modkey }, 'x',
        function ()
            awful.spawn('xkill')
        end,
        {description = 'kill window', group = 'windows'}),

    -- Launchers
    awful.key({ modkey }, 'space',
        function ()
            awful.spawn(drun)
        end,
        {description = 'open apps launcher', group = 'launchers'}),

    awful.key({ modkey }, 'r',
        function ()
            awful.spawn(run)
        end,
        {description = 'open run prompt', group = 'launchers'}),

    -- Apps
    awful.key({ modkey }, 'Return', 
        function () 
            awful.spawn(terminal) 
        end,
        {description = 'open terminal', group = 'apps'}),

    awful.key({ modkey }, 'w', 
        function () 
            awful.spawn(wallpaper) 
        end,
        {description = 'wallpaper', group = 'apps'}),

    awful.key({}, 'Print', 
        function () 
            awful.spawn('flameshot full') 
        end,
        {description = 'take screenshot', group = 'apps'}),

    awful.key({ 'Control' }, 'Print', 
        function () 
            awful.spawn('flameshot launcher') 
        end,
        {description = 'take region screenshot', group = 'apps'}),
    
    awful.key({ modkey }, 'b', 
        function () 
            awful.spawn(browser) 
        end,
        {description = 'open webbrowser', group = 'apps'}),

    awful.key({ modkey }, 'f',
        function ()
            awful.spawn(filemanager)
        end,
        {description = 'open file manager', group = 'apps'}),

    -- Media
    awful.key({}, 'XF86AudioLowerVolume', 
        function () 
            awful.spawn('amixer -q sset Master 5%-') 
        end,
        {description = 'lower volume', group = 'media'}),

    awful.key({}, 'XF86AudioRaiseVolume', 
        function () 
            awful.spawn('amixer -q sset Master 5%+') 
        end,
        {description = 'Raise volume', group = 'media'}),

    awful.key({}, 'XF86AudioMute', 
        function () 
            awful.spawn('amixer -q sset Master toggle') 
        end,
        {description = 'toggle mute', group = 'media'}),

    awful.key({}, 'XF86MonBrightnessDown', 
        function () 
            awful.spawn('brightnessctl set 5%-') 
        end,
        {description = 'lower brightness', group = 'media'}),

    awful.key({}, 'XF86MonBrightnessUp', 
        function () 
            awful.spawn('brightnessctl set +5%') 
        end,
        {description = 'raise brightness', group = 'media'})
)

clientkeys = gears.table.join(
    awful.key({ modkey, }, 'F11',
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = 'toggle fullscreen', group = 'windows'}),

    awful.key({ modkey }, 'q',
        function (c) 
            c:kill()
        end,
        {description = 'close window', group = 'windows'}),

    awful.key({ modkey }, 'F10',
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end,
        {description = 'toggle maximize', group = 'windows'})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
