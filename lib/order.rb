# Order class definition
# this class is responsible for collecting and processing orders
# and requesting text confirmation from SendSMS class
# require_relative 'send_sms'
class Order
  attr_reader :cart # no need to have attr_reader, turned on for rspec
# This class is injected with SendSMS class which is used at the end
  def initialize(send_sms_class = SendSMS)
    @send_sms_class = send_sms_class
    @cart = [] # save a hash like {dish: quantity}
  end

#  add_to_order adds dish object and quantity provided to @cart[]
  def add_to_order(dish, quantity)
    # @cart << [dish, quantity]
    @cart << [dish, quantity]
  end

#  checkout takes phone number as argument and triggers request_confirmation
# to confirm whether to process order or not, true = go ahead, false abort
# this method will also throw error if @cart is empty
  def checkout(phone_number)
    raise 'Cart is empty' if @cart.empty?
    show_cart
    # confirm_total # confirms total with customer aka getting payment
    success = request_confirmation(phone_number) if confirm_total
    # printing feedback
    puts success ? 'Successful! You should receive a confirmation SMS with estimated time soon' :
    'Computer says no.. :('

  end

# show_cart prints @cart contents prettier alongside pricing and grand total
# calculated bu calculate_total
  def show_cart
    raise 'Cart is empty' if @cart.empty?
    puts '-' * 60
    puts 'Dish'.ljust(30) + 'Price'.center(10) + 'Quantity'.center(10) + 'Total'.rjust(10)
    puts '-' * 60
    @cart.each do |ind_dish|
      puts "#{ind_dish.first.name}".ljust(30) +
      "£#{ind_dish.first.price}".center(10) +
      "#{ind_dish.last}".center(10) +
      "£#{ind_dish.first.price * ind_dish[1]}".rjust(10)
    end
    puts '=' * 60
    puts 'Grand Total'.ljust(50) + "£#{calculate_total}".rjust(10)
    puts '=' * 60
  end

#  confirm_total will ask the user to enter the full billing amount shown
# and returns true if correct amount entered
  def confirm_total
    puts 'Please enter the total amount as listed above to place order'
    amount = gets.chomp.to_f.round(2)
    amount == calculate_total
  end

  # private # made private as rubonov was messing up with %

# request_confirmation takes phone number as argument and creates an object of
# SendSMS class in order to proceed with sending text message
  def request_confirmation(phone_number)
    new_sms = @send_sms_class.new()
    new_sms.send(phone_number, calculate_total)
  end

  private
# calculate total calculates and returns total amount from @cart after running
# .round(2) on it
  def calculate_total
    total = 0
    @cart.each { |dish| total += dish.first.price * dish.last }
    total.round(2)
  end

end
