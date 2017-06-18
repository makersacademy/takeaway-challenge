

class Order

  attr_reader :basket, :menu

  def initialize
    @basket = {}
    @menu = Menu.new
  end

  def add_to_basket(dish, quantity)
    check_availability dish
    @basket.store(dish, quantity)
  end

  def check_availability(dish) #can be improved?
    raise ("Your choice of dishes is not available") unless menu.dishes.keys.include?(dish)
  end

  def display_basket
    @basket.each_with_index { |(food, quantity), index| puts "#{index + 1} - #{food} : #{quantity} pcs at £#{menu.dishes[food]} each /n" }
  end

end
