require_relative 'pizza'

class Order

attr_reader :basket, :price

  def initialize(pizza_class = Pizza)
    @basket = []
    @confirmation_of_order = []
    @menu = pizza_class
    @price = 0
  end

  def add_to_order(item, quantity)
    quantity.times { @basket << item }
    return_order
  end

  def total_price
    @basket.each do |item|
      @price += @menu.new.view_food_and_price[item.to_sym].to_f
    end
    @price
  end

private

  def return_order
    @basket
  end

end
