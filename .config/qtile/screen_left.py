from libqtile import widget
from quick_settings import *

def init_widgets_list_left():
    widgets_list = [
        widget.Clock(format = '   %H:%M ',
            background = color2,
            foreground = color1,
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('fish -c "~/.config/qtile/time.sh"')}),
        widget.TextBox(background = color2,
            text = ' '),
        widget.GroupBox(background = color2,
            active = color1,
            inactive = color4,
            disable_drag = True,
            highlight_method = 'line',
            highlight_color = color1,
            block_highlight_text_color = color2),
        widget.TextBox(background = color2,
            text = ' '),
        widget.WindowName(background = color1,
        foreground = color2,
        padding = 10),
        widget.CPU(background = color2,
            foreground = color1,
            format = ' 󰇺  {load_percent}% '),
        widget.Memory(background = color2,
            foreground = color1,
            format = ' 󰘚 {MemUsed:.0f}MB '),
        widget.Volume(background = color2,
            foreground = color1,
            fmt = ' 󰕾 {} ',
            update_interval = 0.1,
            step = 5),
        widget.Battery(background =  color2,
            foreground = color1,
            battery = 'CMB1',
            format = '   {percent:2.0%} '),
        widget.Clock(format=' %d.%m %a   ',
            background = color2,
            foreground = color1),
    ]
    return widgets_list


