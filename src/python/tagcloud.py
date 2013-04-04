#!/usr/bin/env python
"""Recipe Miner

Usage:
  tagcloud.py <csv_file> <tag_column> <count_column> <output_file>

Options:
  -h --help     Show this screen.

"""
import csv
from docopt import docopt
from pytagcloud import create_tag_image, make_tags

if __name__ == '__main__':

    arguments = docopt(__doc__)

    tag_column = int(arguments['<tag_column>'])
    count_column = int(arguments['<count_column>'])

    food_counts = []
    with open(arguments['<csv_file>'], 'rb') as csvfile:
        reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        for row in reader:
            count_tuple = (unicode(row[tag_column], 'utf-8'), int(row[count_column]))
            food_counts.append(count_tuple)
            if len(food_counts) >= 150:
                break

    tags = make_tags(food_counts, minsize=10, maxsize=80)
    create_tag_image(tags, arguments['<output_file>'], size=(900, 550), layout=4, fontname='Lobster')


