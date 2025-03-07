from libqtile.config import Group

icons = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
labels = ['x']

groups = [
    Group(icons[0], layout = 'columns', label = labels[0]),
    Group(icons[1], layout = 'columns', label = labels[0]),
    Group(icons[2], layout = 'columns', label = labels[0]),
    Group(icons[3], layout = 'columns', label = labels[0]),
    Group(icons[4], layout = 'columns', label = labels[0]),
    Group(icons[5], layout = 'columns', label = labels[0]),
    Group(icons[6], layout = 'columns', label = labels[0]),
    Group(icons[7], layout = 'columns', label = labels[0]),
    Group(icons[8], layout = 'columns', label = labels[0]),
]
