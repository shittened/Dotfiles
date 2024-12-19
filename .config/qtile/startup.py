from libqtile import hook
from colors import colors

@hook.subscribe.startup
def get_colors():
    color1 = colors[6]
    color2 = colors[10]
    color3 = colors[8]
    return[color1, color2, color3]

def startup():
    pass
