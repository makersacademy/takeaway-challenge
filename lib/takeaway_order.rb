require_relative 'restaurant'

class TakeawayOrder
  attr_reader :basket
  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @basket = {}
  end

  def list_menu
    @restaurant.menu
  end

  def add(item, quantity = 1)
    @basket[item] += quantity if @basket.key?(item)
    @basket[item] = quantity unless @basket.key?(item)
    "#{quantity}x #{item} has been added to your basket"
  end

  def check_bill(expected_bill)
    bill = @restaurant.bill(@basket)
    raise "Order costs £#{bill}, not £#{expected_bill}" if expected_bill != bill
    "Your order costs £#{bill}"
  end

  def delete(item, quantity)
    if @basket.key?(item)
      @basket[item] -= quantity unless quantity > @basket[item]
      @basket[item] = 0 if quantity > @basket[item]
    end
    "#{quantity}x #{item} has been deleted from your basket"
  end
end
