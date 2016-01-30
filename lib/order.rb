require_relative 'menu'
require_relative 'text'

class Order
  attr_reader :overview, :menu, :text

  def initialize(menu,text=nil)
    @menu = menu
    @text = text
    @overview = []
  end

  def show_menu
    menu
  end

  def select_dish(quantity,dish)
    overview << [quantity, dish, menu.dishes[dish]]
  end

  def show_sum
    calculate_price
  end

  def show_selection
    [overview,"Total sum for order is: #{show_sum}"]
  end

  def place(value)
    fail "Incorrect value - should be #{show_sum}" if value != show_sum
    confirmation
    show_selection
  end

  def confirmation
    # Twilio number +441442796264
    time = (Time.now + (60*60)).strftime("%H:%M")
    msg = "Thank you! Your order of #{show_sum} was placed and will be delivered before #{time}"
    text.send_confirmation(msg) if text
  end

  private

  def calculate_price
    overview.inject(0){|sum,dish| sum + (dish[0]*dish[2])}
  end
end
