require './lib/dishes.rb'

class Takeaway

  include Dishes

  attr_reader :order

  def print_menu
    @menu.each do |item|
      p "#{item[:dish]}, #{item[:price]}"
    end
  end

  def select_dish(dish, quantity)
    @order = []
    @menu.each do |item|
      if item[:dish] == dish
        quantity.times { @order.push(item) }
      end
    end
    @order
  end

end
