from libqtile import bar, qtile
from libqtile.config import Screen
from screen_left import init_widgets_list_left
from screen_right import init_widgets_list_right

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list_left()
    return widgets_screen1
def init_widgets_screen2():
    widgets_screen2 = init_widgets_list_right()
    return widgets_screen2

def init_screens():
    return [Screen(top = bar.Bar(widgets = init_widgets_screen1(), size = 28, margin = [0, -20, 6, -20]),
                   bottom = bar.Gap(4),
                   left = bar.Gap(4),
                   right = bar.Gap(4)),
            Screen(top = bar.Bar(widgets = init_widgets_screen2(), size = 28, margin = [0, -20, 6, -20]),
                   bottom = bar.Gap(4),
                   left = bar.Gap(4),
                   right = bar.Gap(4))]

def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)
