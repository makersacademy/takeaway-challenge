class Order

  attr_reader :menu, :basket, :total_cost

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total_cost = 0
  end

  def add_dish_to_order(dish, quantity = 1)
    fail("Sorry, food safety regulations prevent us from serving #{dish.name}!") unless menu.includes?(dish)
    @basket << [dish, quantity]
  end

  def calculate_cost
    @basket.each do |dish, quantity|
      @total_cost += dish.price * quantity
    end
    @total_cost
  end
end
