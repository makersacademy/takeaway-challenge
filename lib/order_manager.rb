require_relative "order"
require_relative "menu"
require_relative "dish"

class OrderManager

  attr_reader :orders

  def initialize
    @orders = []
  end

  def prices_sum(list_of_dishes)
    total = 0
    list_of_dishes.each { |dish| @total += dish.price }
    total
  end


  def create_order(menu) # menu must be Menu object
    selected_dishes = []
    print_dishes(menu.dishes_list)
    print_options(menu, selected_dishes)
    @orders << Order.new(selected_dishes)
  end

  def print_dishes(list)
    list.each_with_index do |dish, index|
      print "#{index + 1}.".center(4)
      puts "#{dish.name.ljust(25, ".")} £#{sprintf("%.2f", dish.price)}"
    end
  end

  def print_options(menu, selected_dishes)
    puts "What would you like to order?"
    puts "To finish, just hit return twice."
    loop do
      puts "Please select dish by number."
      choice = get_user_choice
      if choice.empty?
        break
      else
        selected_dishes << process_choice(choice, menu)
        puts "Added to order: #{selected_dishes[-1].name}"
        puts "Total cost so far: £#{sprintf("%.2f", prices_sum(selected_dishes))}"
      end
    end
    selected_dishes
  end

  def process_choice(input, menu)
    menu.dishes_list[input.to_i - 1]
  end

  def get_user_choice
    input = STDIN.gets.chomp
  end

  def print_subtotal

        # puts "Your order so far:"
        # print_dishes(@selected_dishes)
  
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
