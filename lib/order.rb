require_relative 'sms'

class Order

  attr_reader :basket

  def initialize(menu, basket = [])
    @menu = menu
    @basket = basket
  end

  def add_to_basket(dish)
    @basket << @menu.find_dish(dish)
  end

  def show_basket_subtotal
    subtotal = 0.00
    @basket.each do |dish|
      subtotal += dish.price
    end
    subtotal = subtotal.round(2)
    return "Your basket costs £#{subtotal}"
  end

  def check_out
    if @basket.length == 0
      raise "You have no items in your basket! Please add some and then check out."
    else
      puts "Thank you. Would you like to receive a text message confirmation? (yes/no)"
      response = gets.chomp.downcase
      if response == "yes"
        puts "Please enter your mobile phone number."
        mobile_number = gets.chomp
        Sms.new(mobile_number)
      else
        puts "Thank you."
      end
    end
  end

end
