from libqtile import layout
from libqtile.config import Match
from settings import get_colors

color1 = get_colors()[0]
color2 = get_colors()[1]
color3 = get_colors()[2]

layout_theme = {"border_width": 3,
                "margin": 5,
                "border_focus": color1[1:],
                "border_normal": color2[1:],
                "border_on_single": True,
                "margin_on_single": 5,
                }

layouts = [
    layout.Columns( **layout_theme),
    #layout.Max( **layout_theme),
    # layout.Stack(num_stacks=2),
    #layout.Bsp(**layout_theme),
    #layout.Matrix( **layout_theme),
    #layout.MonadTall(**layout_theme),
    #layout.MonadWide( **layout_theme),
    #layout.RatioTile( **layout_theme),
    #layout.Tile(**layout_theme),
    # layout.TreeTab(),
    #layout.VerticalTile(**layout_theme),
    # layout.Zoomy(),
    layout.Floating()
]

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='floating'),
    Match(wm_class='eww-keqing'),
    ],
    **layout_theme)

