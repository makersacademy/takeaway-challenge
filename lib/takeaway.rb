require_relative 'menu'
require_relative 'display'
# require_relative 'text_provider'

# TODO properly implement Twilio - add to initialize as a new class instance under @test
# TODO extract display messages out into display class - takeaway class has too much responsibility

class Takeaway

  attr_reader :menu, :basket, :display

  def initialize(display = Display.new)
    @menu = Menu.new
    @basket = []
    @display = display
  end

  def lists_dishes_with_prices
    print "#{extracts_starters} #{extracts_main_course} #{extracts_dessert}"
  end

  # TODO should this be in the menu class not the takeaway class?
  def extracts_starters
    extracts(menu_starters(), [1, 2], "Starters")
  end

  def extracts_main_course
    extracts(menu_main_course(), [3, 4], "Main Courses")
  end

  def extracts_dessert
    extracts(menu_dessert(), [5, 6], "Desserts")
  end

  def extracts(course, numbers, description)
    course1 = course[numbers[0]].map { |k, v| "#{k} = £#{v}" }.join(', ')
    course2 = course[numbers[1]].map { |k, v| "#{k} = £#{v}" }.join(', ')
    course1_key = course.keys[0]
    course2_key = course.keys[1]
    print "#{description}: #{course1_key}. #{course1}, #{course2_key}. #{course2} "
  end

  # TODO refactor to avoid repetition- DRY 3's
  # TODO should this be in the menu class not the takeaway class?
  def menu_starters
    @menu.starters
  end

  def menu_main_course
    @menu.main_course
  end

  def menu_dessert
    @menu.dessert
  end

  def interactive_menu
    continue_ordering = true
    while continue_ordering do
      print_menu
      continue_ordering = process_menu(@display.read_input)
    end
  end

  def print_menu
    puts "1. Place orders"
    puts "2. Show order selections"
    puts "7. Exit"
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
      puts "I don't know what you mean, try again"
      true
    end
  end

  def place_orders
    puts "Take a note of the order numbers from our menu: #{lists_dishes_with_prices}"
    puts "Enter the order numbers you'd like to add to your basket:"
    puts "Remember, to exit select 7 or hit double space twice"
    order_num = @display.read_input
    until order_num.empty? do
      @basket << order_num.to_i
      order_num = @display.read_input
    end
  end

  def print_orders
    if @basket.count.zero?
      puts "You have made no orders!"
    elsif @basket.count == 1
      puts "You have 1 order: order number #{@basket.join(', ')}"
    else
      puts "You have #{@basket.count} orders: order numbers #{@basket.join(', ')}"
    end
  end

  # TODO DRY this up 3 x repetion
  def gives_orders_with_dishes_hash
    orders_values = []
    @basket.map do |order_num|
      orders_values << menu_starters.fetch(order_num) if menu_starters.has_key?(order_num)
      orders_values << menu_main_course.fetch(order_num) if menu_main_course.has_key?(order_num)
      orders_values << menu_dessert.fetch(order_num) if menu_dessert.has_key?(order_num)
    end
    orders_values
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
    puts "Thanks for ordering! Your combined orders total: #{prices} which gives a total of £#{total}"
  end

  # def delivers_text_notification
  #   @text.client.messages.create
  # end

end
