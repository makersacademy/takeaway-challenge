class Order
  attr_reader :order
  def initialize(restaurant = Restaurant.new)
    @menu = restaurant.show_menu
    @order = Hash.new
    @menu.each do |dish, price|
      order[dish.to_sym] = 0
    end
  end

  def add_dish(dish)
    p @menu
    p @order
    p @menu.has_key?("pasta".to_sym)
    p @menu.has_key?("noodles".to_sym)
    if @menu.has_key?(dish.to_sym)
      @menu[dish.to_sym] += 1
    else
      raise "We don't have that dish"
    end
  end
end
