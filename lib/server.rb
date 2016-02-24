require_relative './menu.rb'
require_relative './cuisine.rb'

class Server

  attr_reader :menu, :order_total

  def initialize(menu_klass, cuisine_klass, price_calculator_klass)
    @menu_klass = menu_klass
    @cuisine_klass = cuisine_klass
    @price_calculator_klass = price_calculator_klass
    @order_total = 0
  end

  def request_cuisine(cuisine)
    @cuisine = @cuisine_klass.new(cuisine, dish = Dish)
    @cuisine.create_dishes
  end

  def create_menu
    @calc = @price_calculator_klass.new(self)
    @menu = @menu_klass.new(calc = @calc)
    @cuisine.dishes.each do |dish|
      menu.add_dishes(dish)
    end
  end

  def present_menu
    menu.view_prices
    menu.price_list.each do |dish,price|
      puts "#{dish} --- £#{price}"
    end
  end

  def select_dish(dish_name,quantity)
    menu.select_dish(dish_name,quantity)
  end

  def take_order
    menu.make_order
  end

  def total
    menu.selected_dishes.each do |dish,quantity|
      @order_total += dish.price * quantity
    end
    raise "Order Total incorrect." if order_total != @calc.grand_total
    order_total
  end

  def present_total
    puts "Your meal's total cost is £#{@calc.grand_total}"
  end

  def present_subtotals
    puts "Your dishes' prices are as follows:"
    @calc.subtotals.each do |ary|
      puts "#{ary[0]}, #{ary[2]} ordered at £#{ary[1]} each.  The subtotal of these items is £#{ary[3]}."
    end
  end
end
