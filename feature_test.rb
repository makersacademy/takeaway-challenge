require './lib/takeaway.rb'

adesso = Takeaway.new

adesso.show_menu
adesso.make_an_order(1)
adesso.make_an_order(10)
adesso.show_total
adesso.confirm_order
