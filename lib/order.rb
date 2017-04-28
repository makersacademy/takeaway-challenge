require_relative 'menu'

class Order

  attr_reader :total_cost, :items

  def initialize(menu)
    @items = []
    @total_cost = 0
    @menu = menu
  end

  def add_item(item)
    @items << @menu.dishes[item - 1]
  end

  def calculate_total
    @items.each do |item|
      @total_cost += item[:price]
    end
    @total_cost
  end

end
