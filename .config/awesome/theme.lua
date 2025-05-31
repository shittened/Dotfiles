local beautiful = require('beautiful')
local gears = require('gears')
require('settings')
local gfs = require('gears.filesystem')
require('awful.autofocus')

local themes_path = gfs.get_themes_dir()

awesome.themes_path = '~/.config/awesome/themes'
beautiful.init(gears.filesystem.get_themes_dir() .. theme .."/theme.lua")

beautiful.font = font .. '10'
beautiful.bg_normal = color2
beautiful.bg_focus =  color1
beautiful.bg_urgent = color1
beautiful.bg_minimize = color2
beautiful.bg_systray = color2
beautiful.fg_normal = color1
beautiful.fg_focus = color2
beautiful.fg_urgent = color2
beautiful.fg_minimize = color3
beautiful.useless_gap = gaps
beautiful.border_width = border
beautiful.border_normal = color2
beautiful.border_focus  = color1
beautiful.border_marked = color1
beautiful.tasklist_disable_icon = true
beautiful.systray_icon_spacing = 5

-- Generate taglist squares:
local taglist_square_size = 6
beautiful.taglist_squares_sel = beautiful.theme_assets.taglist_squares_sel(
    taglist_square_size, beautiful.fg_focus
)
beautiful.taglist_squares_unsel = beautiful.theme_assets.taglist_squares_unsel(
    taglist_square_size, beautiful.fg_normal
)
beautiful.taglist_font = font .. '10'

-- Variables set for theming notifications:
notification_font = font
notification_bg = color1
notification_fg = color2
--notification_[width|height|margin]
notification_border_color = color2
notification_border_width = 3
--notification_[border_color|border_width|shape|opacity]

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua

-- You can use your own layout icons like this:
beautiful.layout_fairh = themes_path.."default/layouts/fairhw.png"
beautiful.layout_fairv = themes_path.."default/layouts/fairvw.png"
beautiful.layout_floating  = themes_path.."default/layouts/floatingw.png"
beautiful.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
beautiful.layout_max = themes_path.."default/layouts/maxw.png"
beautiful.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
beautiful.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
beautiful.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
beautiful.layout_tile = themes_path.."default/layouts/tilew.png"
beautiful.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
beautiful.layout_spiral  = themes_path.."default/layouts/spiralw.png"
beautiful.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
beautiful.layout_cornernw = themes_path.."default/layouts/cornernww.png"
beautiful.layout_cornerne = themes_path.."default/layouts/cornernew.png"
beautiful.layout_cornersw = themes_path.."default/layouts/cornersww.png"
beautiful.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
beautiful.icon_theme = icon_theme

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

