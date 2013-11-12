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

Customer.destroy_all

Customer.create(
    id:           1,
    display_name: "TheRubeAbides",
    admin:        true,
    name:         "Brian Winterling",
    provider:     "twitter",
    uid:          "1861525993",
    image:        "http://pbs.twimg.com/profile_images/378800000452817789/45df711ffe853cecd69db816f53b5672_normal.jpeg"
  )

Customer.create(
    id:           2,
    display_name: "MappingKat",
    admin:        true,
    name:         "Katrina Engelsted",
    provider:     "twitter",
    uid:          "386676260",
    image:        "http://pbs.twimg.com/profile_images/2591519611/cu3a0rg573rerw0sf8iw_normal.png"
  )

Customer.create(
    id:           3,
    display_name: "myShadyBaby",
    admin:        false,
    name:         "ShadyBaby - Brian",
    provider:     "twitter",
    uid:          "28745607",
    image:        "http://pbs.twimg.com/profile_images/121089562/SB_avitar_normal.jpg"
  )
