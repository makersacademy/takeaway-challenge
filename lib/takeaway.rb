require_relative 'takeaway_menu'
require_relative 'basket'
require_relative 'messager'

class TakeAway

  def initialize(
    menu_class = TakeAwayMenu, menu = menu_class.new, basket = Basket.new(menu)
  )
    @menu = menu
    @basket = basket
  end

  def read_menu
    @menu.read
  end

  def add_to_basket(dish)
    @basket.add(dish)
    "#{dish} added to basket"
  end

  def view_basket
    @basket.view
  end

  def complete_order(customer_number, messager = Messager.new(customer_number),
    time_in_30 = (Time.now + 30 * 60).strftime("%I:%M%p"))
    messager.send_sms("Thank you! Your order was placed and will be delivered before #{time_in_30}")
    "Thank you for your order. A confirmation text has been sent to #{customer_number}."
  end

end
