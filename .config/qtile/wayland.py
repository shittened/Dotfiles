from libqtile.backend.wayland import InputConfig

wl_input_rules = {
    "*": InputConfig(
        #accel_profile = 'adaptive',
        #click_method = 'button_areas',
        #drag = True,
        #grag_lock = False,
        #left_handed = False,
        #middle_emulation = True,
        natural_scroll = True,
        #pointer_accel = 0.5,
        #scroll_button = 'disable',
        #scroll_method = 'two_finger',
        tap = True,
        #tap_button_map = 'lrm',
    ),
    "type:keyboard": InputConfig(
        kb_layout = 'XKB_DEFAULT_LAYOUT',
        kb_options = 'XKB_DEFAULT_OPTIONS',
        kb_repeat_delay = 200,
        kb_repeat_rate = 25,
        kb_variant = 'XKB_DEFAULT_VARIANT',
        left_handed = False,
    )
}
