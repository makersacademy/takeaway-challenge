require_relative 'menu'

class Order

  attr_reader :menu_list, :basket

  def initialize(menu_list = Menu::MENU_LIST)
    @menu_list = menu_list
    @basket = []
  end

  def add(dish, quantity)
    price = @menu_list[dish]
    price = menu_list[dish]*quantity
    @basket << {dish => price}
    "#{quantity}x #{dish}(s) added to your basket"
  end

  def view_order
    basket.each{| hash | hash.each {|dish, value| puts dish.to_s + ' : ' + value.to_s }}
  end

end
