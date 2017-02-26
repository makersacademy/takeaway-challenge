require './lib/takeaway.rb'

adesso = Takeaway.new

adesso.show_menu
adesso.make_a_new_order
adesso.select_dish(3)
adesso.select_dish(10)
adesso.show_total
adesso.confirm_order(Messenger.new)
adesso.order_history
