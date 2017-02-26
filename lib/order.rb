require_relative "menu"
class Order
  attr_reader :selected_dishes, :options, :cost
  def initialize
    @selected_dishes = []
  end

  def amount(food)
    @selected_dishes << food
    @selected_dishes
  end

  def number_of_each_item_selected
    @selected_dishes.uniq.map{|x| @selected_dishes.count(x)}
  end

  def prices
    menu = Menu.new
    @selected_dishes.uniq.map{|x| menu.items_on_menu[x]}
  end

  def cost_items
    @cost = prices.zip(number_of_each_item_selected)
    @cost.map{|x| x.inject(:*)}
  end

  def total
    "The total amount due is £#{cost_items.inject(:+).round(2)}"
  end


end
