
require_relative './menu.rb'
require_relative './receipt.rb'

class Order

  TIME_FORMAT = '%H:%M'

  attr_reader :basket, :menu, :total_cost

# initialize with your menu of choice. Defaults with Menu.
  def initialize(menu = Menu)
    @basket = []
    @menu = menu.new
    @total_cost = 0
  end

  # Check your chosen menu
  def check_menu
    @menu.check_menu
  end

  # Choose a dish and enter quantity
  def make_order(dish, quantity = 1)
    fail "Sorry, that dish is not available" if dish_unavailable(dish)

    @total_cost += @menu.cost(dish, quantity)
    @basket << { dish.to_sym => quantity }
  end

  # Check what you have ordered
  def check_order
    order_calculator
  end

  # Submit your order
  def submit_order(receipt = Receipt.new)
    receipt.confirmation(message)
    message
  end

  private

  # method gives 30 minutes from now
  def time_check
    one_hour = Time.now + 1*60*60
    one_hour.strftime(TIME_FORMAT)
  end

  def dish_unavailable(dish)
    @menu.dish_available?(dish) == false
  end

  def order_calculator
    list = []
    @basket.each do |items|
      items.each do |key, value|
        list << "#{key} x #{value} "
      end
    end
    list.join + "Total: £#{total_cost}"
  end

  def message
    "#{check_order} \nWill be with you for #{time_check}"
  end

end
