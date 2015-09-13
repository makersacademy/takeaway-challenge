class Order 

  attr_accessor :basket
  attr_reader :total, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0.0
  end

  def check_dishes
    menu.dishes_available
  end

  def add_item(dish, quantity = 1)
    fail 'That item is not on the menu' unless menu.dishes_available.has_key?(dish)
    basket << dish
    @total += menu.dishes_available[dish]
  end

  def remove_item(dish, quantity = 1)
    fail 'Item was not in the basket' unless basket.include?(dish)
    basket.delete(dish)
    @total -= menu.dishes_available[dish]
  end


end