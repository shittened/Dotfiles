local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')

local space = wibox.widget{
    text = '   ',
    widget = wibox.widget.textbox
}

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ " x ", " x ", " x ", " x ", " x ", " x ", " x ", " x ", " x " }, s, awful.layout.layouts[1])

    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    s.mylayoutbox = wibox.container.margin(s.mylayoutbox, 5, 5, 5, 5)
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "bottom",
        screen = s,
        height = 28,
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            {
                wibox.widget{
                    text = '  >~<  ',
                    widget = wibox.widget.textbox
                },
                bg = beautiful.bg_focus,
                fg = beautiful.fg_focus,
                widget = wibox.container.background
            },
            space,
            s.mytaglist,
            space,
        },
        wibox.widget.separator(),
        --s.mytasklist, -- Middle widget
        { -- Right widgets
            space,
            awful.widget.watch('bash -c ~/.config/awesome/stats.sh', 1),
            wibox.container.margin(wibox.widget.systray(), 5, 5, 5, 5),
            {
                wibox.widget{
                    format = '  %a, %d %b  %H:%M  ',
                    widget = wibox.widget.textclock
                },
                bg = beautiful.bg_focus,
                fg = beautiful.fg_focus,
                widget = wibox.container.background
            },
            --s.mylayoutbox,
            layout = wibox.layout.fixed.horizontal,
        },
    }
end)
