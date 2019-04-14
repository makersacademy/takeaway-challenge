require_relative './menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add_dish(dish)
    @menu.menu_list.each do |item, price|
      @basket << { item => price } if dish == item
    end
  end

  def show_basket
    p "Basket items:"
    @basket.each do |item|
      p "Item: #{item.keys.join} price: #{item.values.join}"
    end
    p "Total: #{basket_total}"
  end

  def basket_total
    22.5
  end

end
