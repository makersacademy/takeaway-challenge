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
    @current_selection = []
    @current_selection << dish_selection.to_i
    @interface.select_quantity
  end

  def add_quantity(dish_quantity)
    @current_selection << dish_quantity
    unit_price_lookup
  end

  def return_order
    puts "So that's #{@current_selection[1]} x #{@menu.menu[@current_selection[0]]} costing £#{@current_selection[2].round(3)}"
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
    @current_selection = []
    @orders_array = []
    @running_total = 0
    @interface.select_dish
  end

  def send_confirmation
    an_hours_time = Time.now + 3600
    an_hours_time = an_hours_time.strftime("%H:%M")
    puts "We have received your order! It will be with you by #{an_hours_time}"
    account_sid = 'ACdd3bf2c71d0a35779cb6f8b3d2425165'
    auth_token = '******REDACTED******'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => +441163263729,
      :to => +447479782492,
      :body => "We have received your order! It will be with you by #{an_hours_time}"
      })
      @interface.main_menu
    end


    private

    def unit_price_lookup
      unit_price = @menu.prices[@current_selection[0]]
      calculate_subtotal(unit_price)
    end

    def calculate_subtotal(unit_price)
      selection_cost = @current_selection[1] * unit_price
      @current_selection << selection_cost
      calculate_running_total(selection_cost)
      build_orders_array
    end

    def calculate_running_total(selection_cost)
      @running_total += selection_cost
      build_orders_array
    end

    def build_orders_array
      @orders_array << @current_selection
      return_order
    end

  end
