require './lib/takeaway'
require './lib/menu'
require './lib/order'

takeaway = Takeaway.new()

takeaway.view_menu

takeaway.add("Garlic Bread", 2)
takeaway.add("Padana", 1)
takeaway.add("Americana", 1)
takeaway.add("Dips", 1)

puts takeaway.check_total
