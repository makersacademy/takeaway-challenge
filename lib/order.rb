class Order

  require_relative 'menu'

  require 'ap'
  require 'twilio-ruby'

  def initialize(menu)
    @menu = menu
    @orders_array = []
    @current_selection = []
    @running_total = 0
  end

  def select_dish
    @menu.print_menu
    puts "Enter the number of the dish you'd like to order"
    puts "When you're finished, type 'done'"
    puts "If you've changed your mind, type 'exit'"
    dish_selection = gets.chomp
    validate_selection(dish_selection)
  end

  def validate_selection(dish_selection)
    case dish_selection
    when "done" then order_summary(@orders_array)
    when "exit" then puts "Thank you, goodbye"
      exit
    else
      dish_selection = dish_selection.to_i
      select_quantity(dish_selection)
      @menu[dish_selection]
    end
  end

  def select_quantity(dish_selection)
    puts "How many would you like?"
    dish_quantity = gets.chomp.to_i
    calculate_subtotal(dish_selection, dish_quantity)
  end

  def calculate_subtotal(dish_selection, dish_quantity)
    selection_cost = dish_quantity * @menu.prices[dish_selection].to_f
    calculate_running_total(selection_cost)
    build_current_selection_array(dish_quantity, dish_selection, selection_cost)
  end

  def calculate_running_total(selection_cost)
    @running_total += selection_cost
  end

  def build_current_selection_array(dish_quantity, dish_selection, selection_cost)
    @current_selection << dish_quantity
    @current_selection << dish_selection
    @current_selection << selection_cost
    build_orders_array
  end

  def build_orders_array
    @orders_array << @current_selection
    return_order(@current_selection)
  end


  def return_order(current_selection)
    puts "So thats #{current_selecton[0]} x #{@menu.menu[current_selecton[1]]} costing £#{current_selecton[2].round(3)}"
    @current_selection = []
    select_dish
  end

  def order_summary(orders_array)
    puts "ORDER SUMMARY:"
    orders_array.each_with_index do |x,index|
      puts "#{index + 1}. #{x[0]} x #{@menu.menu[x[1]]}: £#{x[2]}"
    end
    puts "-----------"
    puts "TOTAL: £#{@running_total}"
    confirm_order
  end

  def confirm_order
    puts "To confirm, press 'y'"
    puts "To redo the order, press 'n'"
    confirmation = gets.chomp
    confirmed?(confirmation)
  end

  def confirmed?(confirmation)
    if confirmation == "y"
      send_confirmation
    elsif confirmation == "n"
      @orders_array = []
      @running_totl = 0
      select_dish #spawn new instance of order
    else
      puts "Not a valid entry, try again"
      confirm_order
    end
  end

end
