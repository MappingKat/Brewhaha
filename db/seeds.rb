# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require './spec/seeder'

Category.destroy_all

Category.create(
    available:    TRUE,
    name:         "Cocktails",
    description:  "Let's give my tastebuds something new to enjoy.",
    sort_order:   10,
  )

Category.create(
    available:    TRUE,
    name:         "Wine",
    description:  "A thousand years of tradition can't be wrong.",
    sort_order:   20,
  )

Category.create(
    available:    TRUE,
    name:         "Plain ol' Beer",
    description:  "I want a beer I recognize from TV ads.",
    sort_order:   30,
  )

Category.create(
    available:    TRUE,
    name:         "Craft Beer",
    description:  "Brewing beer is an artform and I want a masterpiece.",
    sort_order:   40,
  )

Category.create(
    available:    TRUE,
    name:         "Ciders",
    description:  "Johnny Appleseed in a pint glass.",
    sort_order:   50,
  )

Item.destroy_all
Seeder.load_items_csv

Customer.destroy_all

Customer.create(
    display_name: "TheRubeAbides",
    admin:        false,
    name:         "Brian Winterling",
    weight:       195,
    sex:          "male",
    provider:     "twitter",
    uid:          "1861525993",
    image:        "http://pbs.twimg.com/profile_images/378800000452817789/45df711ffe853cecd69db816f53b5672_normal.jpeg"
  )

Customer.create(
    display_name: "MappingKat",
    admin:        true,
    name:         "Katrina Engelsted",
    weight:       115,
    sex:          "female",
    provider:     "twitter",
    uid:          "386676260",
    image:        "http://pbs.twimg.com/profile_images/2591519611/cu3a0rg573rerw0sf8iw_normal.png"
  )

Customer.create(
    display_name: "myShadyBaby",
    admin:        true,
    name:         "ShadyBaby - Brian",
    provider:     "twitter",
    uid:          "28745607",
    image:        "http://pbs.twimg.com/profile_images/121089562/SB_avitar_normal.jpg"
  )

Customer.create(
    display_name: "QuillyT",
    admin:        true,
    name:         "Quentin Tai",
    weight:       145,
    sex:          "male",
    provider:     "twitter",
    uid:          "20703965",
    image:        "http://pbs.twimg.com/profile_images/1858010175/313339_10100210771768496_1510176_48196641_1670461624_n_normal.jpg"
  )
