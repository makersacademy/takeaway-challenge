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
end
