require_relative 'twilio-api'
require_relative 'print'

class Order
  include Print

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
    @basket_total = @basket.clone
    @total = 0
  end

  def add(dish, quantity = 1)
    @basket[dish] += quantity && @basket_total[dish] += quantity
    add_to_total
    add_to_basket(dish, quantity)
  end

  def total(input)
    raise incorrect_total(@total) unless correct?(input)
    print_total(@total)
  end

  def basket
    @basket.each do |dish, quantity|
      price = @menu.cuisine[dish] * quantity
      view_basket(quantity, dish, price)
    end
  end

  def checkout
    reset_total
    message
  end

  private

  def message(twilio = TwilioAPI.new)
    twilio.send_sms
  end

  def reset_total
    @total = {}
    @basket = {}
  end

  def add_to_total
    @basket_total.each do |dish, quantity|
      @price = @menu.cuisine[dish] * quantity
      @basket_total.delete(dish)
    end
    @total += @price
  end

  def correct?(input)
    input == @total
  end

end
