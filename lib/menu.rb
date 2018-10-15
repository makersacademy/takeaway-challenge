require './lib/order.rb'

class Menu

  attr_reader :order, :list

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
    list_dishes
    print @menu
  end

  def select(dish, quantity = 1)
    if @list.include?(dish) == false
      "Please select an item from the menu."
    else
    order.add(dish, quantity)
    "Added #{quantity} #{dish}(s) to your order"
    end
  end

# in the middle of creating subtotal
  def total
    order.total(@list)
  end

  # def see_list
  #   order.see_menu
  # end

# check whats in basket
# menu.order.basket

end
