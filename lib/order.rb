class Order

  require_relative 'menu'

  require 'ap'
  require 'twilio-ruby'

  def initialize(menu)
    @menu = menu
    @orders_array = []
    @current_selecton = []
    @running_total = 0
  end

  def select_dish
    @menu.print_menu
    puts "Enter the number of the dish you'd like to order"
    puts "When you're finished, type 'done'"
    puts "If you've changed your mind, type 'exit'"
    @dish_selection = gets.chomp
    validate_selection(@dish_selection)
  end

  def validate_selection(selection)
    case selection
    when "done" then order_summary
    when "exit" then puts "Thank you, goodbye"
      exit
    else
      @dish_selection = selection.to_i
      select_quantity
    end
  end

  def select_quantity
    puts "How many would you like?"
    @dish_quantity = gets.chomp.to_i
    calculate_subtotal
  end

  def calculate_subtotal
    @selection_cost = @dish_quantity * @menu.prices[@dish_selection].to_f
    calculate_running_total
    build_current_selection_array
  end

  def calculate_running_total
    @running_total += @selection_cost
  end

  def build_current_selection_array
    @current_selecton << @dish_quantity
    @current_selecton << @dish_selection
    @current_selecton << @selection_cost
    build_orders_array
  end

  def build_orders_array
    @orders_array << @current_selecton
    return_order
  end


  def return_order
    puts "So thats #{@dish_quantity} x #{@menu.menu[@dish_selection]} costing £#{@selection_cost.round(3)}"
    @current_selecton = []
    select_dish
  end

  def order_summary
    puts "ORDER SUMMARY:"
    @orders_array.each_with_index do |x,index|
      puts "#{index + 1}. #{x[0]} x #{@menu.menu[x[1]]}: £#{x[2]}"
    end
    puts "-----------"
    puts "TOTAL: £#{@running_total}"
    confirm_order
  end

  def confirm_order
    puts "To confirm, press 'y'"
    puts "To redo the order, press 'n'"
    @confirmation = gets.chomp
    confirmed?
  end

  def confirmed?
    case @confirmation
    when @confirmation == "y"
      send_confirmation
    when @confirmation == "n"
      select_dish #spawn new instance of order
    else
      puts "Not a valid entry, try again"
    end
  end

end
