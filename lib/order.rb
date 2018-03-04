# Order class definition
# this class is responsible for collecting and processing orders
# and requesting text confirmation from SendSMS class
# require_relative 'send_sms'
class Order
  attr_reader :cart, :total
  def initialize(send_sms_class = SendSMS)
    @send_sms_class = send_sms_class
    @cart = [] # save a hash like {dish: quantity}
    @total = 0
  end

  def add_to_order(dish, quantity)
    @cart << [dish, quantity]
  end

  def checkout(phone_number)
    raise 'Cart is empty' if @cart.empty?
    request_confirmation(phone_number)
  end

  def show_cart
    raise 'Cart is empty' if @cart.empty?
    puts '-' * 60
    puts 'Dish'.ljust(30) + 'Price'.center(10) + 'Quantity'.center(10) + 'Total'.rjust(10)
    puts '-' * 60
    @cart.each do |ind_dish|
      puts "#{ind_dish.first.name}".ljust(30) +
      "#{ind_dish.first.price}".center(10) +
      "#{ind_dish.last}".center(10) +
      "#{ind_dish.first.price * ind_dish[1]}".rjust(10)
    end
    puts '=' * 60
    puts 'Grand Total'.ljust(50) + "#{calculate_total}".rjust(10)
    puts '=' * 60
  end

  # private
  def request_confirmation(phone_number)
    new_sms = @send_sms_class.new()
    new_sms.send(phone_number)
  end

  private
  def calculate_total
    # raise 'Cart is empty' if @cart.empty?
    @cart.each { |dish| @total += dish.first.price * dish.last }
    @total
  end
end
