require_relative 'basket'
require_relative 'menu'
require_relative 'text_confirmation'

class Takeaway
  def initialize(confirmation = TextConfirmation.new,
    menu = Menu.new,
    basket = Basket.new
  )
    @menu = menu
    @basket = basket
    @confirmation = confirmation
  end

  def show_menu
    menu.show
  end

  def order(dish, amount = 1)
    error_not_on_menu if not_on_menu?(dish)
    price = price_of(dish)
    basket.add(dish, amount, price)
    order_added_confirmation(dish, amount)
  end

  def show_basket
    basket.show
  end

  def checkout(amount)
    error_incorrect_amount if incorrect?(amount)
    confirmation.send_message(amount)
  end

  private

  attr_reader :menu, :basket, :confirmation

  def error_not_on_menu
    raise 'Cannot process order: that dish is not on the menu'
  end

  def price_of(dish)
    menu.price(dish)
  end

  def not_on_menu?(dish)
    !menu.includes_dish?(dish)
  end

  def order_added_confirmation(dish, amount)
    "Added #{amount} x #{dish} to your order"
  end

  def error_incorrect_amount
    raise 'failed to check out: incorrect amount'
  end

  def incorrect?(amount)
    amount != basket.total
  end
end
