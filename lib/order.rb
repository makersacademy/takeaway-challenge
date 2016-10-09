class Order

  require_relative 'menu'

  require 'ap'
  require 'twilio-ruby'

  attr_reader :orders_array, :current_selection, :running_total

  def initialize(menu, interface)
    @menu = menu
    @interface = interface
    @orders_array = []
    @current_selection = []
    @running_total = 0
  end

  def add_dish(dish_selection)
    @current_selection << dish_selection.to_i
    @interface.select_quantity
  end

  def add_quantity(dish_quantity)
    @current_selection << dish_quantity
    unit_price_lookup
  end

  def unit_price_lookup
    unit_price = @menu.prices[@current_selection[0]]
    calculate_subtotal(unit_price)
  end

  def calculate_subtotal(unit_price)
    selection_cost = @current_selection[1] * unit_price
    @current_selection << selection_cost
    calculate_running_total(selection_cost)
    build_orders_array
    selection_cost
  end

  def reset_order
    @current_selection = []
    @orders_array = []
    @running_total = 0
    @interface.select_dish #spawn new instance of order
  end

  def send_confirmation
    an_hours_time = Time.now + 3600
    an_hours_time = an_hours_time.strftime("%H:%M")
    puts "We have received your order! It will be with you by #{an_hours_time}"
    account_sid = 'ACdd3bf2c71d0a35779cb6f8b3d2425165'
    auth_token = 'a3c0e71366cde8ec7e4efd4b58a901bd'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
    	:from => 'ACdd3bf2c71d0a35779cb6f8b3d2425165',
    	:to => +447479782492,
    	:body => "We have received your order! It will be with you by #{an_hours_time}"
    })
    @interface.main_menu
  end

  private

  def calculate_running_total(selection_cost) # this isn't working properly
    @running_total += selection_cost
  end

  def build_orders_array
    @orders_array << @current_selection
    reset_current_selection
    @interface.return_order
  end

  def reset_current_selection
    @current_selection = []
  end

end
