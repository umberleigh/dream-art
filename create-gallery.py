#!/usr/bin/env python3

from jinja2 import Template

template = Template('''
# DreamArt Gallery

## Style Images
{% for img in styleImages %}
<img src="https://raw.githubusercontent.com/bamos/dream-art/master/examples/inputs/{{ img }}" height="400px">
{%- endfor %}

{% for path,name in examples %}
## {{name}}

### Original
<img src="https://raw.githubusercontent.com/bamos/dream-art/master/examples/inputs/{{path}}.jpg" height="400px">

### Deep Dream
<img src="https://raw.githubusercontent.com/bamos/dream-art/master/examples/outputs/{{path}}_deepdream.png" height="400px">

### Styles

{% for tag in styleTags -%}
<img src="https://raw.githubusercontent.com/bamos/dream-art/master/examples/outputs/{{path}}_{{tag}}_deepdream.png" height="400px">
{% endfor -%}

{% endfor %}
''')

styleImages = ['escher_sphere.jpg',
               'frida_kahlo.jpg',
               'picasso_selfport1907.jpg',
               'seated-nude.jpg',
               'shipwreck.jpg',
               'starry_night.jpg',
               'the_scream.jpg',
               'woman-with-hat-matisse.jpg']
styleTags = ['escher', 'kahlo', 'picasso', 'seated', 'shipwreck', 'starry',
             'scream', 'matisse']
examples = [('tubingen', 'Tubingen'),
            ('golden_gate', 'Golden Gate'),
            ('brad_pitt', 'Brad Pitt')]
with open('gallery.md', 'w') as f:
    f.write(template.render(styleImages=styleImages,
                            styleTags=styleTags,
                            examples=examples))
