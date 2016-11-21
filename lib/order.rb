require_relative "menu"
require_relative "confirmation"

class Order
  # Allows the customer to place an order

  attr_reader :selection, :shopping_cart, :menu, :prices, :total, :confirmation

  def initialize(menu = Menu.new)
    @selection = {}
    @shopping_cart = []
    @menu = menu
    @prices = []
  end

  def start
    puts @menu.welcome
    puts @menu.list_menu
  end

  def select_items(item, quantity)
    @selection = { item.to_sym => quantity }
    add_selection_to_order
    return "#{quantity} x #{item}(s) added to your shopping cart"
  end

  def add_selection_to_order
    @shopping_cart << @selection
  end

  def get_price
    @shopping_cart.each do |food_item|
      food_item.each do |item, quantity|
        @price = menu.menu_items[item]
        puts "#{quantity} x #{item.to_s} at £#{@price} = £#{@price *= quantity}"
        @prices << @price
      end
    end
  end

  def price_calculation
    puts get_price
    calculate_total_price
    puts display_total_price
    puts confirm_message
  end

  def calculate_total_price
    @total = @prices.reduce { |memo, sum| memo += sum }
  end

  def display_total_price
    raise "An error has occurred. Please try again" if @total != @prices.reduce { |memo, sum| memo += sum }
    return "Your total is £#{@total}"
  end


  def confirm_message
    "Do you want to confirm this order?"
  end

  def confirm(answer, confirmation = Confirmation.new)
    raise "You have cancelled your order. Please try again" if answer.downcase != "yes"
    @confirmation = confirmation
  end


end
