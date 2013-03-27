#!/usr/bin/env python

import csv
from pytagcloud import create_tag_image, make_tags

for metric in [
    'drinks_ingredients_counts',
    'brunch_ingredients_counts',
    'desserts_ingredients_counts',
    'valentines_ingredients_counts',
    'burns_night_ingredients_counts',
    'christmas_ingredients_counts',
    'ingredients_counts',
    'italian_ingredients_counts',
    'indian_ingredients_counts',
    'asian_ingredients_counts'
    ]:

    food_counts = []
    with open('/home/ross/documents/msc/data-mining/src/csv/{}.csv'.format(metric), 'rb') as csvfile:
        reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        for food_id, food_title, food_count in reader:
            count_tuple = (unicode(food_title, 'utf-8'), int(food_count))
            food_counts.append(count_tuple)
            if len(food_counts) >= 150:
                break

    tags = make_tags(food_counts, minsize=10, maxsize=100)
    create_tag_image(tags, '{}.png'.format(metric), size=(1024, 768), layout=4, fontname='Lobster')
