require './lib/takeaway.rb'
p fast = Takeaway.new
p fast.list_menu
fast.order(:onion_rings, 1)
fast.order(:margerita, 1)
p fast.selected
