require_relative 'order'

class Menu

  def initialize(order = Order.new)
    @order = order
    @menu = [
      { name: "Butterbeer", price: "3" }
    ]
  end

  def see
    menu.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish[:name]}: #{dish[:price]} sickles"
    end
  end

  def choose(dish)
    order.add(dish)
  end

  private

  attr_reader :menu, :order
end
