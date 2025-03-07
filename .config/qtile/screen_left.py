from libqtile import widget
from settings import get_colors

def init_widgets_list_left():
    color1 = get_colors()[0]
    color2 = get_colors()[1]
    color3 = get_colors()[2]

    widgets_list = [
        widget.GroupBox(
            background = color2,
            active = color1,
            inactive = color3,
            disable_drag = True,
            highlight_method = 'line',
            this_current_screen_border = color1,
            highlight_color = color1,
            block_highlight_text_color = color2,
            padding_x = 6,
            spacing = 0,
        ),
        widget.WindowName(
            background = color1,
            foreground = color2,
            padding = 10,
        ),
        widget.CPU(
            background = color2,
            foreground = color1,
            format = ' 󰇺  {load_percent}% ',
        ),
        widget.Memory(
            background = color2,
            foreground = color1,
            format = ' 󰘚 {MemUsed:.0f}MB ',
        ),
        widget.Volume(
            background = color2,
            foreground = color1,
            fmt = ' 󰕾 {} ',
            update_interval = 0.1,
            #get_volume_command = 'amixer -D pulse',
            step = 5,
        ),
        widget.Battery(
            background =  color2,
            foreground = color1,
            battery = 'CMB1',
            format = '   {percent:2.0%} ',
        ),
        widget.Clock(
            format=' %H:%M %d.%m %a ',
            background = color2,
            foreground = color1,
        ),
        widget.Systray(
            background = color2,
            icon_size = 20,
            padding = 1,
        ),
    ]

    return widgets_list

