require_relative './lib/takeaway'
require_relative './lib/menu'
require_relative './lib/menu_item'


thai = Menu.new

p thai.list

p thai.add "kung-po", 7
p thai.add "chop-suey", 5
p thai.add "egg phoo yung", 6

puts thai.list
p ""

thai.remove "kung-po"
puts thai.list





chineese = Takeaway.new

p chineese

p chineese.menu #<= should return a hash {item: 1}


p chineese.add_to_order :item, :item2
