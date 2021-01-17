require_relative "order"
require_relative "menu"
require_relative "dish"
require_relative "twilio_manager"

class OrderManager

  attr_reader :orders, :menu

  # 45 min for delivery
  DELIVERY_TIME = 45*60

  def initialize
    @menu = Menu.new
    @menu.load_menu("lib/menu.csv")
    @orders = []
    @basket = []
  end

  def prices_sum(list_of_dishes)
    total = 0
    list_of_dishes.each { |dish| total += dish.price }
    total
  end

  def create_order
    print_dishes(menu.dishes_list)
    ask_what_user_wants_to_order
    @orders << Order.new(@basket)
    order_confirmation
    @basket = []
  end

  def print_dishes(list)
    list.each_with_index do |dish, index|
      print "#{index + 1}.".center(4)
      puts "#{dish.name.ljust(25, ".")} £#{sprintf("%.2f", dish.price)}"
    end
  end

  def ask_what_user_wants_to_order
    puts "What would you like to order?"
    puts "To finish, just hit return twice."
    add_items_to_basket
  end

  def add_items_to_basket
    loop do
      puts "Please select dish by number."
      choice = user_choice
      if choice.empty?
        break
      else
        @basket << dish_choice_from_input(choice)
        puts "Added to order: #{@basket[-1].name}"
        puts "Total cost so far: £#{sprintf("%.2f", prices_sum(@basket))}"
      end
    end
  end

  def dish_choice_from_input(input)
    menu.dishes_list[input.to_i - 1]
  end

  def user_choice
    STDIN.gets.chomp
  end

  def order_confirmation
    print_confirmation
    send_sms
  end

  def print_confirmation
    puts "Your order has been created."
    puts "You ordered:"
    print_dishes(@orders[-1].dishes)
    puts "The total cost will be £#{sprintf("%.2f", prices_sum(@orders[-1].dishes))}"
    puts "Thanks for ordering!"
  end

  def send_sms
    it_will_arrive_before = estimated_arrival_time(@orders[-1])
    TwilioManager.new.send_sms(it_will_arrive_before)
  end

  def estimated_arrival_time(order)
    order.time + DELIVERY_TIME
  end


end
