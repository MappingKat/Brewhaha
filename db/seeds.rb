# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require './spec/seeder'

Item.destroy_all
Seeder.load_items_csv

Category.destroy_all

Category.create(
    id:           1,
    available:    TRUE,
    name:         "Cocktails",
    description:  "Let's give my tastebuds something new to enjoy.",
    sort_order:   10,
  )

Category.create(
    id:           2,
    available:    TRUE,
    name:         "Wine",
    description:  "A thousand years of tradition can't be wrong.",
    sort_order:   20,
  )

Category.create(
    id:           3,
    available:    TRUE,
    name:         "Plain ol' Beer",
    description:  "I want a beer I recognize from TV ads.",
    sort_order:   30,
  )

Category.create(
    id:           4,
    available:    TRUE,
    name:         "Craft Beer",
    description:  "Brewing beer is an artform and I want a masterpiece.",
    sort_order:   40,
  )

Category.create(
    id:           5,
    available:    TRUE,
    name:         "Ciders",
    description:  "Johnny Appleseed in a pint glass.",
    sort_order:   50,
  )
