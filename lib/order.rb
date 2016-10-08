class Order

  require_relative 'menu'

  require 'ap'
  require 'twilio-ruby'

  def initialize(menu, interface, validation_class = Validation)
    @menu = menu
    @validation_class = validation_class
    @interface = interface
    @orders_array = []
    @current_selection = []
    @running_total = 0
  end

  def validate_selection(dish_selection)
    if dish_selection == "exit"
      puts "Thank you, goodbye"
      exit
    elsif dish_selection.to_i > 0
      if dish_selection.to_i <= @menu.menu.length
        @current_selection << dish_selection.to_i
        @interface.select_quantity
      else
        invalid_input
      end
    else
      invalid_input
    end
  end

  def invalid_input
    puts "Not a valid input"
    @interface.select_dish
  end

  def validate_quantity(dish_quantity)
    if dish_quantity > 10
      puts "Please enter a value between 1 and 10"
      @interface.select_quantity
    else
      @current_selection << dish_quantity
      calculate_subtotal
    end
  end

  def evaluate_input(selection)
    case selection
    when "1"
      @interface.select_dish
    when "2"
      order_summary
    else
      "Not a valid input"
      @interface.add_or_review
    end
  end

  def calculate_subtotal
    selection_cost = @current_selection[1] * @menu.prices[@current_selection[0]].to_f
    calculate_running_total(selection_cost)
    @current_selection << selection_cost
    calculate_running_total(selection_cost)
    build_orders_array
  end

  def calculate_running_total(selection_cost)
    @running_total += selection_cost
  end

  def build_orders_array
    @orders_array << @current_selection
    return_order
  end

  def return_order
    puts "So thats #{@current_selection[1]} x #{@menu.menu[@current_selection[0]]} costing £#{@current_selection[2].round(3)}"
    @current_selection = []
    @interface.add_or_review
  end

  def order_summary
    puts "ORDER SUMMARY:"
    @orders_array.each_with_index do |x,index|
      puts "#{index + 1}. #{x[0]} x #{@menu.menu[x[1]]}: £#{x[2]}"
    end
    puts "-----------"
    puts "TOTAL: £#{@running_total}"
    @interface.confirm_order
  end

  def confirmed?(confirmation)
    if confirmation == "y"
      send_confirmation
    elsif confirmation == "n"
      @orders_array = []
      @running_total = 0
      @interface.select_dish #spawn new instance of order
    else
      puts "Not a valid entry, try again"
      @interface.confirm_order
    end
  end

  def send_confirmation
    puts "We have received your order, it will be with you shortly!"
    exit
  end

end
