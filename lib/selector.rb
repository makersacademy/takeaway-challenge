require_relative 'menu'

class Order

  attr_reader :show_all, :main_order

  def initialize
    @show_menu = Menu.new.all
    @final_order = []
  end

  def select_item(item)
    @show_all.find {|x| x[:dish] == item }
  end

  def total_price
    @final_order.select {|item| item[:price].inject(:+) }
  end

  def place_order(item)
    @final_order << select_item(item)
  end

end