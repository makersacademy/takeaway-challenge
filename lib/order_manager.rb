require_relative "order"
require_relative "menu"

class OrderManager

  attr_reader :orders

  def initialize
    @orders = []
  end

  def prices_sum(list_of_dishes)
    @total = 0
    list_of_dishes.each { |dish| @total += dish.price }
    @total
  end


  def create_order(menu)
    print_dishes(menu.dishes_list)
    print_options(menu)
    @orders << Order.new([])
  end

  # def create_order
  #   print_dishes(dishes_list)
  #   @selected_dishes = []
  #   get_user_choices
  #   @orders << Order.new(@selected_dishes)
  # end

  def print_dishes(list)
    list.each_with_index do |dish, index|
      print "#{index + 1}.".center(4)
      puts "#{dish.name.ljust(25, ".")} £#{sprintf("%.2f", dish.price)}"
    end
  end

  def get_user_choice
    input = STDIN.gets.chomp
  end

  def print_options(menu)
    puts "What would you like to order?"
    puts "To finish, just hit return twice."
    loop do
      puts "Please select dish by number."
      # input = get_user_choice
      process_choice(get_user_choice, menu)
      break
    end
  end

  def process_choice(input, menu)
    menu.dishes_list[input.to_i - 1]
  end


  # def get_user_choices
  #   puts "What would you like to order?"
  #   puts "To finish, just hit return twice."
  #   loop do
  #     puts "Please select dish by number."
  #     input = gets.chomp
  #     if input.empty?
  #       break
  #     elsif input.to_i <= dishes_list.length
  #       @selected_dishes << dishes_list[input.to_i - 1]
  #       puts "Added to order: #{dishes_list[input.to_i - 1].name}"
  #       puts "Your order so far:"
  #       print_dishes(@selected_dishes)
  #       puts "Total cost so far: £#{sprintf("%.2f", prices_sum(@selected_dishes))}"
        
  #     end
  #   end
  # end


end
