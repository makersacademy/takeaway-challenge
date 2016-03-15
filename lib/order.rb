require 'dotenv'
Dotenv.load

class Order

  attr_reader :menu

  def initialize(menu_klass:Menu,  menu: nil, sms_klass: SMS)
  @menu_class = menu_klass
  @menu = menu || @menu_class.new
  @order = []
  @cilent = sms_klass.new
  end

  def load_menu(menu)
    @menu = menu
    self
  end

  def add_to_menu(dish,price)
    @menu.add_dish(dish,price)
  end

  def display_menu
    @menu.display
  end

  def take_order(dish,quantity)
    @dish, @quantity = dish, quantity
    raise "That dish is not available" unless dish_available?
    raise "Quantity must be an integer" unless quantity_valid?
    add_to_order
    @order
  end

  def view_current_order
    @order.dup
  end

  def place_order(amount)
    raise "Not enough money given" unless amount > order_total
    confirm_order
  end

  def confirm_order
    @order.clear
    send_sms
    "Order has been placed"
  end

  def order_total
    total = 0
    @order.each do |hash|
      hash.each do |dish,quantity|
      total += (display_menu[dish] * quantity)
    end
  end
    total
  end

  private

  def send_sms
    @cilent.send
  end

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
