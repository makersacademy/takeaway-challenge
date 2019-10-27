require_relative 'display'
require_relative 'sms'

class Order
  attr_reader :basket
  def initialize(restaurant, display = Display.new, sms = Sms.new)
    @display = display
    @restaurant = restaurant
    @sms = sms
    @basket = []
  end

  def request_menu
    @display.menu(@restaurant)
  end

  def view_basket
    @display.basket(self)
  end

  def request_item(name)
    @basket << @restaurant.hold_portion_of_requested_dish(name)
  end

  def basket_total_price
    @sum = 0
    @basket.each do |dish|
      dish.each do |name, price|
        @sum += price
      end
    end
    @sum
  end

  def cancle_order
    @basket.each do |dish|
      dish.each do |name, price|
        @restaurant.undo_portion_deductions(name.to_s)
      end
    end
    clear_basket
  end

  def checkout
    unless correct_payment_amount?
      # @sms.order_not_placed
      raise "Incorrect Payment Amount"
    end

    @restaurant.availabilty_checker
    # @sms.order_placed_message
    clear_basket
  end

  private

  def clear_basket
    @basket = []
  end

  def correct_payment_amount?
    @payment = gets.to_i
    basket_total_price == @payment
  end

end
