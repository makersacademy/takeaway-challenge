require_relative 'restaurant'

class Takeaway
  attr_reader :basket
  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @basket = {}
  end

  def list_menu
    @restaurant.menu
  end

  def add(item, quantity)
    if @basket.key?(item)
      @basket[item] += quantity
    else
      @basket[item] = quantity
    end

    "#{quantity}x #{item} has been added to your basket"
  end

  def check_bill(expected_bill)
    bill = @restaurant.bill(@basket)
    raise "Order costs £#{bill}, not £#{expected_bill}" if expected_bill != bill
    "Your order costs £#{bill}"
  end

end
