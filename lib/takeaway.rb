require './lib/menu'
require './lib/order'
require './lib/message'

class Takeaway
  attr_reader :menu, :order, :text

  def initialize(menu = Menu.new, order = Order.new, text = Message.new)
    @menu = menu
    @order = order
    @text = text
  end

  def add_to_order(dish)
    order.add(dish)
  end

  def remove_from_order(dish)
    order.remove(dish)
  end
  
  def show_menu
    food = ""
    menu.dishes.each { |dish| food.concat("#{dish.name}, £#{dish.price}\n") }
    food
  end

  def checkout
    print_basket
    text.send("Your order will be ready in an hour") if confirm_order
  end

  def print_basket
    food = ""
    order.basket.each do |dish|
      food.concat("#{dish.name} - #{dish.price}\n")
    end
    food.concat("Total: #{order.total}")
    p food
  end

  private

  def confirm_order
    p "Is this order correct? (y/n)"
    gets.chomp == "y"
  end

end
