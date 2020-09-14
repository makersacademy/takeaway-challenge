require_relative 'menu'
require_relative 'text'

class Takeaway
  attr_reader :menu, :basket
  def initialize(menu_object)
    @menu = menu_object
    @basket = []
  end

  def see_menu
    menu.read_menu
  end 

  def order(dishname, quantity)
    @menu.dishes.each do |dish_object|
      if dish_object.name == dishname
        @basket << [dish_object, quantity]
      end
    end 
  end 

  def basket_summary
    @basket.each do |dish_array|
      puts "Dish: #{dish_array[0].name} Price: £#{dish_array[0].price} Quantity: #{dish_array[1]}"
    end
  end 

  def order_total
    order_total = []
    @basket.each do |dish_array|
      order_total << dish_array[0].price * dish_array[1]
    end 
    sum = order_total.inject(0, &:+)
    "Order total is £#{sum}"
  end 

  def checkout
    #Would need to adjust textclass to use user number
    Text.new
    puts "Your order has been checked out"
    self.basket_summary
    self.order_total
  end 
end