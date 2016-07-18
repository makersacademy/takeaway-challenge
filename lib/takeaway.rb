require_relative 'menu'

class Takeaway

  attr_reader :order_list, :menu

  def initialize(menu, order_list = [])
    @order_list = order_list
    @menu = menu
  end

  def order(dish_name, quantity=1)
    fail "Wrong item selected!" unless in_menu?(dish_name)
     @order_list << "#{quantity}x #{dish_name.to_sym}: #{quantity*(@menu[dish_name.to_sym])}"
  end

  private

  def get_dish(dish_name)
    @menu.select { |name| dish_name.to_sym == name }
  end

  def in_menu?(dish_name)
    @menu.include? dish_name.to_sym
  end

end
