require_relative 'menu'
require_relative 'display'
require_relative 'text_provider'

# TODO properly implement Twilio - add to initialize as a new class instance under @test
# TODO extract display messages out into display class - takeaway class has too much responsibility

class Takeaway

  attr_reader :menu, :basket, :display

  def initialize(display = Display.new)
    @menu = Menu.new
    @basket = []
    @display = display
  end

  def interactive_menu
    continue_ordering = true
    while continue_ordering do
      @display.print_interactive_menu
      continue_ordering = process_menu(@display.read_input)
    end
  end

  def process_menu(selection)
    case selection
    when "1"
      place_orders
      true
    when "2"
      show_orders
      true
    when "7"
      false
    else
      @display.print_error_message
      true
    end
  end

  def place_orders
    @display.print_instructions
    order_num = @display.read_input
    until order_num.empty? do
      @basket << order_num.to_i
      order_num = @display.read_input
    end
  end

  def count_orders
    if @basket.count.zero?
      @display.print_no_orders
    elsif @basket.count == 1
      @display.print_order(@basket)
    else
      @display.print_orders(@basket)
    end
  end

  # TODO DRY this up 3 x repetion
  def gives_orders_with_dishes_hash
    @basket.map do |order_num|
      @menu.dish_for(order_num)
    end
  end

  def gives_orders_prices
    gives_orders_with_dishes_hash.map do |dish_and_price|
      dish_and_price.values.first
    end
  end

  def calculates_order_cost
    gives_orders_prices.reduce(:+)
  end

  def prints_order_total
    prices = gives_orders_prices().map { |price| "£" + price.to_s }.join(", ")
    total = calculates_order_cost()
    @display.print_total(prices, total)
  end

  def delivers_text_notification(cost)
    @text = TextProvider.new
    @text.send_text(cost)
  end

end
