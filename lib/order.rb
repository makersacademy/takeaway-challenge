class Order
  attr_reader :total_amount, :menu
  
  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @current_order = ''
    @total_amount = 0
    @menu = menu.dishes
  end
  
  def add_dish_to_basket(dish, quantity = 1)
    fail "#{dish} is not on the menu" unless on_the_menu?(dish)
    @basket[dish] += quantity
    add_to_total(dish, quantity)
  end
  
  def current_order
    @current_order = ''
    format_basket
    @current_order
  end
  
  private
  
  def format_basket
    @basket.each do |dish, quantity|
       @current_order << order_list(dish, quantity)
    end
  end
  
  def order_list(dish, quantity)
    "#{dish} x#{quantity}: £%.2f" % (price(dish) *quantity) + "\n"
  end
  
  def add_to_total(dish, quantity) 
    @total_amount += price(dish) * quantity
  end
  
  def on_the_menu?(dish)
    @menu.include? dish
  end
  
  def price(dish) 
    @menu[dish]
  end
end