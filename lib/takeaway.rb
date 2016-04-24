require_relative 'menu'
class TakeAway
  attr_reader :menu, :current_order
  def initialize(menu: Menu.new)
    @menu = menu
    @current_order = []

  end
  def see_menu
    menu.menu_list
  end

  def order(item:, qty:)
     qty.times do | times |
       @current_order << menu.menu_list.select { |k,v| k == item }
     end
   end



end
