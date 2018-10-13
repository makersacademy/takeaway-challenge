require './lib/order.rb'

class Menu

  attr_reader :order

  def initialize(order = Order.new)
    @list = { "pizza" => 5.99, "chips" => 1.99, "burger" => 2.99, "kebab" => 3.99 }
    @menu = ""
    @order = order
  end

  def list_dishes
    @list.each_with_index do |(k, v), i|
      @menu << "#{i + 1}. Item: #{k}, Price £#{v}\n"
    end
    @menu
  end

# no rspec test for this yet
  def display
    print @menu
  end

  def select_dish(dish)
    order.add_dish(dish)
    "Added 1 #{dish} to your order"
  end

# check whats in basket
# menu.order.basket

end
