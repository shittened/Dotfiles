from libqtile import bar, qtile
from libqtile.config import Screen
from screen_left import init_widgets_list_left
from screen_right import init_widgets_list_right
from settings import get_colors

color1 = get_colors()[0]

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list_left()
    return widgets_screen1
def init_widgets_screen2():
    widgets_screen2 = init_widgets_list_right()
    return widgets_screen2

def init_screens():
    return [
        Screen(
            top = bar.Bar(
                widgets = init_widgets_screen1(),
                size = 28,
                margin = [10, 15, 10, 15], #NESW
                border_color = color1,
                border_width = 0,
            ),
            bottom = bar.Gap(10),
            left = bar.Gap(10),
            right = bar.Gap(10),
        ),
        Screen(
            top = bar.Bar(
                widgets = init_widgets_screen2(),
                size = 28,
                margin = [10, 20, 10, 20], #NESW
                border_color = color1,
                border_width = 0,
            ),
            bottom = bar.Gap(10),
            left = bar.Gap(10),
            right = bar.Gap(10),
        )
    ]

def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)
