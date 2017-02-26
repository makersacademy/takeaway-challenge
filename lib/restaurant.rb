require_relative 'order'
require_relative 'menu'
require_relative 'text'

class Restaurant

  attr_reader :name, :menu

  def initialize(name)
    @name = name
  end

  def create_menu(filename)
    @menu = Menu.new(filename)
  end

  def display_menu
    @menu ? @menu.print : "No menu exists. Please contact the restaurant"
  end

  def create_order(customer_name)
    @order = Order.new(@menu.format_menu, customer_name)
  end

  def display_order_summary
    @order.display_order_summary
  end

  def confirm(phone_number)
    Text.new.send_SMS(phone_number)
  end

end
