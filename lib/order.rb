require 'dotenv'
Dotenv.load

class Order

  attr_reader :menu

  def initialize(menu_klass:Menu, menu: nil)
  @menu_class = menu_klass
  @menu = menu || @menu_class.new
  @order = []
  end

  def load_menu(menu)
    @menu = menu
    self
  end

  def set_menu(dish,price)
    @menu.add_dish(dish,price)
  end

  def display_menu
    @menu.display
  end

  def take_order(dish,quantity)
    @dish = dish
    @quantity = quantity
    raise "That dish is not available" unless dish_available?
    raise "Quantity must be an integer" unless quantity_valid?
    add_to_order
    @order
  end

  def view_current_order
    @order.dup
  end

  private

  def dish_available?
    display_menu.include?(@dish)
  end

  def quantity_valid?
    @quantity.is_a? Integer
  end

  def add_to_order
    @order << {@dish => @quantity}
  end

end

# ENV['ACCOUNT_SID']
