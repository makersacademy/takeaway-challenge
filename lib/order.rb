class Order

  require_relative 'menu'

  require 'ap'
  require 'twilio-ruby'

  attr_reader :orders_array, :current_selection

  def initialize(menu, interface)
    @menu = menu
    @interface = interface
    @orders_array = []
    @current_selection = []
    @running_total = 0
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
      puts "#{index + 1}. #{x[1]} x #{@menu.menu[x[0]]}: £#{x[2]}"
    end
    puts "-----------"
    puts "TOTAL: £#{@running_total}"
    @interface.confirm_order
  end

  def reset_order
    @orders_array = []
    @running_total = 0
    @interface.select_dish #spawn new instance of order
  end

  def send_confirmation
    puts "We have received your order, it will be with you shortly!"
    exit
  end

end
