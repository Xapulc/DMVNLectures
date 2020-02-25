#import os
import sys

cmf = sys.argv[1]

text = open(cmf).read()
# normalize text
text = text.replace('\r', '\n').replace('\n\n', '\n').replace('  ', ' ').replace('( ', '(').replace(' )', ')').strip()
text = text + '\n'

out_lines = []
fixed = False
lines = text.split('\n')
for line in lines:
    if (line.startswith('texify(') or line.startswith('texify (')) and line.endswith(')'):
        line = line.replace('texify(', '').replace('texify (', '').replace(')', '')
        tokens = line.split(' ')
        if len(tokens) == 2:
            sources = tokens[0]
            archive = tokens[1]
            line = (
                'mm_texify(\n'
                '    SOURCES {}\n'
                '    ARCHIVE {}\n'
                ')'.format(sources, archive)
            )
            fixed = True
        elif len(tokens) == 3:
            sources = tokens[0]
            archive = tokens[1]
            pictures = tokens[2]
            line = (
                'mm_texify(\n'
                '    SOURCES {}\n'
                '    ARCHIVE {}\n'
                '    PICTURES {}\n'
                ')'.format(sources, archive, pictures)
            )
            fixed = True
        else:
            print cmf
            print len(tokens), tokens
    out_lines.append(line)

out_text = '\n'.join(out_lines)
if fixed:
    print out_text

if fixed:
    with open(cmf, 'w') as f:
        f.write(out_text)
