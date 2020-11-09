require_relative 'restaurant'
require_relative 'basket'
require_relative 'messaging'

class Takeaway

  attr_reader :restaurant, :basket

  def initialize(restaurant = Restaurant.new, basket = Basket.new, message = Messaging.new)
    @restaurant = restaurant
    @basket = basket
    @message = message
  end

  def see_menu
    @restaurant.show_menu
  end

  def order(item, quantity = 1)
    # infinite inventory :: quantity not an argument in check_availability
    raise StandardError.new "Sorry, the #{item} is not on the menu." if !restaurant.check_availability(item)
    basket.add_to_basket(item, quantity, @restaurant.item_price(item))
  end

  def basket_summary
    basket.summary
  end

  def total
    @basket.total_value
  end

  def checkout(payment)
    raise StandardError.new "Incorrect amount, the amount due is £#{total}." if !correct_amount?(payment)
    complete_order
  end

  private

  def correct_amount?(payment)
    payment == total
  end

  def complete_order
    @message.send_text("Thank you for your order: £#{total}")
  end

end