require 'order'

class Menu

  attr_reader :menu, :order, :dish, :order_total

  def initialize
    @menu = {"Pepperoni" => 8, "Meat Feast" => 10, "Chicken" => 7}
    @order = []
    @dish = dish
    @order_total = []
    @price_check = []
  end

  def show_menu
    menu
  end

  def show_order
    @order
  end

  def place_order(dish)
    if @menu.has_key?(dish)
       @order_total << @menu.values_at(dish)
       @order << dish
    else raise "Sorry, this dish is not on the menu."
    end
  end

  def total_cost
    @order_total.flatten.reduce(:+)
  end
 end
end
