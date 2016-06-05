require_relative 'menu'

class Order

  attr_reader :show_menu, :final_order, :total_bill

  def initialize
    @show_menu = Menu.new.all
    @final_order = []
  end

  def place_order(item)
    @final_order << select_item(item)
  end

  def total_bill
    total_prices.inject(:+)
  end

private

  def select_item(item)
    @show_menu.find {|x| x[:dish] == item }
  end

  def total_prices
    @final_order.map {|item| item[:price] }
  end

end