require_relative 'restaurant'

class Order

  attr_reader :total, :bill
  attr_accessor :items

  def initialize
    @items = []
    @total
    @bill = 0
  end

  def add_item(dish, quantity)
    quantity.times do 
      @items << dish
    end
  end
  # Restaurant.add_item(item) will go to Order.items and add the dish
  # to fetch price we create a variable called bill and add the item[value]
  # to the variable bill

end
