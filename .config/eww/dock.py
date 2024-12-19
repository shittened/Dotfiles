import os
import json

windows = os.popen('hyprctl clients')
icons_path = '/home/shitten/.config/eww/icons/'
fallback_icon = 'package_applications.png'
apps = []

for line in windows:
    line = line.strip()
    app = {}
    if line.startswith('initialClass'):
        app['name'] = line.split()[1].lower()
        app['icon'] = icons_path + app['name'] + '.png'
        if not (os.path.isfile(app['icon'])):
            app['icon'] = icons_path + fallback_icon
    if line.startswith('pid'):
        app['id'] = line.split()[1]
    if len(app) > 0:
        apps.append(app)

apps [0] = apps[0] | apps[1]
for i in range(len(apps)):
    if i % 2 != 0:
        apps[i - 1] = apps[i - 1] | apps[i]
for i, app in enumerate(apps):
    if len(app) < 2:
        apps.pop(i)
apps = json.dumps(apps)
print(apps)
