require_relative 'restaurant'
require 'twilio-ruby'
require_relative 'messenger'

class TakeawayOrder

  attr_reader :basket

  def initialize(restaurant = Restaurant.new, messenger = Messenger.new)
    @restaurant = restaurant
    @basket = {}
    @messenger = messenger
  end

  def display_menu
    @restaurant.menu
  end

  def add(item, quantity = 1)
    if @restaurant.menu.key?(item)
      @basket[item] += quantity if @basket.key?(item)
      @basket[item] = quantity unless @basket.key?(item)
      "#{quantity}x #{item} has been added to your basket"
    else
      "That's not on the menu!"
    end
  end

  def delete(item, quantity = 1)
    if @basket.key?(item)
      @basket[item] -= quantity unless quantity > @basket[item]
      @basket[item] = 0 if quantity > @basket[item]
      "#{quantity}x #{item} has been deleted from your basket"
    else
      "That's not in your basket!"
    end
  end

  def total
    @restaurant.bill(@basket)
  end

  def complete_order(expected_bill)
    time = (Time.now + 60 * 60).strftime("%k:%M")
    check_bill(expected_bill)
    @messenger.send_text("Thank you! Your order will be delivered before #{time}.")
  end

  private

  def check_bill(expected_bill)
    bill = @restaurant.bill(@basket)
    raise "Order costs £#{bill}, not £#{expected_bill}" if expected_bill != bill
  end

end
