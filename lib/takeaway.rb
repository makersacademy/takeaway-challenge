require './lib/menu.rb'

class Takeaway

attr_reader :your_order

 def view_menu
  Menu.new.menu_layout
 end

 def make_order(order_hash, exact_total)
  @your_order = order_hash
 end

end
