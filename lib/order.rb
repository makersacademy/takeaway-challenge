require_relative "menu"
require_relative "confirmation"

class Order

  attr_reader :selection, :shopping_cart, :menu, :prices, :total

  def initialize
    @selection = {}
    @shopping_cart = []
    @menu = Menu.new
    @prices = []
  end

  def select_items(item, quantity)
    @selection = { item.to_sym => quantity }
    add_selection_to_order
  end

  def add_selection_to_order
    @shopping_cart << @selection
  end

  def get_price
    @shopping_cart.each do |food_item|
      food_item.each do |item, quantity|
        @price = menu.menu_items[item]
        p "#{quantity} x #{item.to_s} at £#{@price} = £#{@price *= quantity}"
        @prices << @price
      end
    end
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

  def confirm(answer)
    raise "You have cancelled your order. Please try again" if answer.downcase != "yes"
    Confirmation.new
  end


end
