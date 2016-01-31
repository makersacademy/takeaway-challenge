require_relative 'menu'
require_relative 'text'

class Order
  BLANKS = 29

  attr_reader :current, :menu, :text

  def initialize(menu,text=nil)
    @menu = menu
    @text = text
    @current = []
  end

  def show_menu
    puts menu.show
  end

  def select_dish(quantity,dish)
    fail ArgumentError, 'Need to select how many you want' if quantity < 1
    price_of_dish = dishes[dish]
    current << [quantity, dish, price_of_dish]
  end

  def show_sum
    calculate_price
  end

  def show_selection
    ["Total sum for order is: #{show_sum}", current]
  end

  def place(value)
    fail "Incorrect value - should be #{show_sum}" if value != show_sum
    confirmation
    show_selection
  end

  private

  attr_reader :dishes

  def dishes
    menu.dishes
  end

  def deliver_time
    (Time.now + (60*60)).strftime("%H:%M")
  end

  def confirmation
    # Twilio number +441442796264
    msg = "Thank you! Your order of #{show_sum} was placed and will be delivered before #{deliver_time}"
    text.send_confirmation(msg) if text
  end

  def calculate_price
    current.inject(0){|sum,selection| sum + (selection[0]*selection[2])}
  end
end
