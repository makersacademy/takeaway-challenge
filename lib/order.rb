require 'menu'

class Order
  attr_reader :selection, :menu, :order, :prices

  def initialize(menu = Menu.new)
    @selection = {}
    @menu = menu
    @order = []
    @prices = []
  end

  def select_dish(item, quantity)
    @selection = { item => quantity }
    add_items_to_order
    return "#{quantity} &#{item}(s) added to your order"
  end

  def add_items_to_order
    @order << @selection
  end

  def get_price
    @order.each do |food| 
      food.each do |item, quantity|
        @price = menu.dishes[item]
        puts "#{quantity} x #{item} at £#{@price *= quantity}"
        @prices << @price
      end
    end
  end

  def calculate_total_price
    @total = @prices.inject { |memo, sum| memo += sum }
  end
end
