require_relative './menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add_dish(dish)
    @menu.menu_list.each do |item, price|
      @basket << { dish => price } if dish == item
    end
  end

end
