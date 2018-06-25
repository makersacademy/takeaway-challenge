require './lib/sms_confirmation.rb'

# Understands taking an order
class Order

  attr_reader :order, :menu, :item, :quantity

  def initialize(menu)
    initialize_error_checks(menu)
    @order = {}
    @menu = menu
  end

  def place_order
    input_order
    confirm_price
    confirm_order
    @order = {}
  end

  private

  def initialize_error_checks(menu)
    raise 'Please provide a valid menu!' unless menu.instance_of? Menu
    raise 'The menu you have provided has no items!' if menu.items.empty?
  end

  # This method needs refactoring, as does the input_price method.
  # Need to work out a better way to structure the loop, and break these down
  # into smaller methods.

  def input_order
    while true do
      puts 'Which dish would you like to order? (exit to finish)'
      item = gets.chomp.capitalize
      break if item.downcase == 'exit'
      raise 'Please enter a valid dish!' unless menu.items.has_key?("#{item}")
      puts 'What quantity of this dish would you like to order?'
      quantity = Integer(gets)
      order.has_key?("#{item}") ? order["#{item}"] += quantity : order["#{item}"] = quantity
    end
  end

  # Likewise this method needs refctoring using a better loop system.

  def input_price
    while true do
      sum = gets.chomp.to_f
      break if sum == calculate_total_price
      puts "Hmm.. Something doesn't look right. Please try again:"
    end
  end

  def confirm_price
    puts 'Please enter the total amount for your order:'
    input_price
    puts 'Order total is correct. Please check your phone for confirmation.'
  end

  def confirm_order
    SmsConfirmation.new.confirm_order
  end

  def calculate_total_price
    total_price = 0
    order.each { |item, quantity| total_price += quantity * menu.items[item] }
    total_price
  end
end
