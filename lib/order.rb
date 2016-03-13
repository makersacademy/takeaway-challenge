require 'dotenv'
Dotenv.load

class Order

  attr_reader :menu

  def initialize(menu_klass:Menu)
  @menu_class = menu_klass
  @menu = @menu_class.new
  @order = []
  end

  def set_menu(dish)
    @menu.add_dish(Dish.new)
  end

  def see_menu
    @menu.list
  end

  def take_order(hash)
    @dish = hash[:dish]
    @quantity = hash[:quantity]
    raise "That dish is not available" unless dish_available?
    raise "Quantity must be an integer" unless quantity_valid?
    add_to_order
    @order
  end

  private

  def dish_available?
    @menu.include?(@dish)
  end

  def quantity_valid?
    @quantity.is_a? Integer
  end

  def add_to_order
    @order << {@dish => @quantity}
  end

end

# ENV['ACCOUNT_SID']
