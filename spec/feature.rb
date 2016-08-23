require './lib/takeaway'
t = Takeaway.new
t.display_menu
t.order "burger"
t.order "pizza", 4
t.order "chips", 2
t.basket_summary
t.total
t.confirm_order
