# Order class definition
# this class is responsible for collecting and processing orders
# and requesting text confirmation from SendSMS class
# require_relative 'send_sms'
class Order
  attr_reader :cart # no need to have attr_reader, turned on for rspec
  def initialize(send_sms_class = SendSMS)
    @send_sms_class = send_sms_class
    @cart = [] # save a hash like {dish: quantity}
  end

  def add_to_order(dish, quantity)
    # @cart = [[Banana, 6],[Banana, 1]]
    @cart << [dish, quantity]

    #
    # if cart.empty?
    #   @cart << [dish, quantity]
    # else
    #   @cart.each{ |e| e[0].eql?(dish) ? e[1] += quantity : @cart << [dish, quantity] }
    # end
  end


  def checkout(phone_number)
    raise 'Cart is empty' if @cart.empty?
    show_cart
    # confirm_total # confirms total with customer aka getting payment
    success = request_confirmation(phone_number) if confirm_total
    # printing feedback
    puts success ? 'Successful! You should receive a confirmation SMS with estimated time soon' :
    'Computer says no.. :('

  end

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


  def confirm_total
    puts 'Please enter the total amount as listed above to place order'
    amount = gets.chomp.to_f
    raise 'Amount enter does not match total, please try again' unless amount.eql?(calculate_total)
    return true
  end

    # private # made private as rubonov was messing up with %

  def request_confirmation(phone_number)
    new_sms = @send_sms_class.new()
    new_sms.send(phone_number, calculate_total)
  end

  private
  def calculate_total
    total = 0
    @cart.each { |dish| total += dish.first.price * dish.last }
    total.round(2)
  end

end
