require_relative 'menu'


class Takeaway

  def order
    @order
  end

  def initialize
    @order = []
  end

  def see_menu
    @menu = Menu.new
    @menu.menu_entries
  end

  def place_order(item, quantity)
    puts "#{quantity}x #{item} added to your order!"
    order = {"#{item} x#{quantity}" => self.see_menu[item] * quantity.to_i}
    self.order << order
  end

=begin def
       item = self.see_menu[item]
       sub-total = item * quantity
       sub-total
#
=end


end
