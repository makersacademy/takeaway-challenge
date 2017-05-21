require_relative 'menu'
require_relative 'display'

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

  # TODO refactor to avoid repetition- DRY 3's - plus each method is doing too much
  # TODO should this be in the menu class not the takeaway class?
  def extracts_starters
    starter1 = menu_starters[1].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter2 = menu_starters[2].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter1_key = menu_starters.keys[0]
    starter2_key = menu_starters.keys[1]
    print "Starters: #{starter1_key}. #{starter1}, #{starter2_key}. #{starter2} "
  end

  def extracts_main_course
    main1 = menu_main_course[3].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main2 = menu_main_course[4].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main1_key = menu_main_course.keys[0]
    main2_key = menu_main_course.keys[1]
    print "Main Courses: #{main1_key}. #{main1}, #{main2_key}. #{main2} "
  end

  def extracts_dessert
    dessert1 = menu_dessert[5].map { |k, v| "#{k} = £#{v}" }.join(', ')
    dessert2 = menu_dessert[6].map { |k, v| "#{k} = £#{v}" }.join(', ')
    dessert1_key = menu_dessert.keys[0]
    dessert2_key = menu_dessert.keys[1]
    print "Desserts: #{dessert1_key}. #{dessert1}, #{dessert2_key}. #{dessert2}"
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

# TODO need to make sure this loop can end, convert to while loop?
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
    while !order_num.empty? do
      @basket << order_num.to_i
      order_num = @display.read_input
    end
  end

  def print_orders
    if @basket.count == 0
      puts "You have made no orders!"
    elsif @basket.count == 1
      puts "You have 1 order: order number #{@basket.join(', ')}"
    else
      puts "You have #{@basket.count} orders: order numbers #{@basket.join(', ')}"
    end
  end

  def calculates_order_cost
    @menu.include? @basket 
    #I need to acccess the numbers in the basket array which are keys to
    @basket.
    reduce(:+)
  end

end
