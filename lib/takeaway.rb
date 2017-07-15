require_relative 'order'

class Takeaway

  MENU = { "Margherita pizza" => 7.99,
        "Hawaiian pizza" => 9.99,
        "Pepperoni pizza" => 11.99,
        "Vegetarian pizza" => 8.99,
        "Meat feast pizza" => 12.99 }

attr_reader :order

  def initialize(order_class = Order)
    @order = order_class.new
  end

  def view_menu
      puts "MA Pizzeria"
      MENU.each { |key, value| puts "#{key} - Price: £#{value}" }
  end
end
