# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
menu_items = [
  { name: "Breakfast Burrito",
    price: 2.75
  },
  { name: "Bagel w. Cream Cheese",
    price: 2.25
  },
  { name: "Vegan Burger",
    price: 7.75
  },
  { name: "BLT",
    price: 6.25
  },
  { name: "Fettucine Pasta",
    price: 6.75
  }
]

puts "Creating Menu Items"
menu_items.each do |item|
  MenuItem.create(item)
end