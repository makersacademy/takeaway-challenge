require_relative 'menu'

class Takeaway

  attr_reader :order_list, :menu

  def initialize(menu, order_list = [])
    @order_list = order_list
    @menu = menu
  end

  def order(name, qty=1)
    fail "Wrong item selected!" unless in_menu?(name)
     @order_list << "#{qty}x #{name.to_sym}: #{qty*(@menu[name.to_sym])}"
  end

  private

  def get_dish(name)
    @menu.select { |dish_name| name.to_sym == name }
  end

  def in_menu?(name)
    @menu.include? name.to_sym
  end

end
