require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(item_class = Menu)
    @menu = item_class.new.list
    @basket = []
    @total = 0
  end

  def add_item(item, price, quantity = 1)
    basket << {item: item, price: price, quantity: quantity}
  end

  def total
    calculate_total
    @total
  end

  private

  def calculate_total
    @total = 0
    basket.each do |item|
      @total += item[:price] * item[:quantity]
    end
  end
end
