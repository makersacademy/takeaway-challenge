require_relative 'restaurant'

class Order

  attr_reader :bill
  attr_accessor :items

  def initialize
    @items = []
    @bill = 0
  end

  def add_item(dish, quantity)
    quantity.times do 
      @items << dish
    end
  end

  def complete
    @items.each do |item|
      item.each do |key, value|
        @bill += value
      end
    end
  end
  # Restaurant.add_item(item) will go to Order.items and add the dish
  # to fetch price we create a variable called bill and add the item[value]
  # to the variable bill

private

  def empty?
    items.empty?
  end
end
