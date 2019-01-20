require_relative 'pizza'

class Order

  attr_reader :basket, :price

  def initialize(pizza_class = Pizza.new)
    @basket = []
    @menu = pizza_class
    @price = 0
  end

  def add_to_order(item, quantity)
    if @menu.view_food_and_price.include?(item.to_sym)
      add_quantity_of_item(item, quantity)
    else
      "Sorry but this is not on our menu."
    end
  end

  def total_price
    @basket.each do |item|
      @price += @menu.view_food_and_price[item.to_sym].to_f
    end
    @price
  end

private

  def return_order
    @basket
  end

  def add_quantity_of_item(item, quantity)
    quantity.times { @basket << item }
    return_order
  end

end
