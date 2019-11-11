require_relative 'menu'
require_relative 'send_sms'
require_relative 'delivery_time'

class Takeaway

  attr_reader :basket, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
  end


  def list_of_options
    puts "Please enter 'display_menu' to see the menu"
    puts "Please enter 'choose(meal, quantity)' in order to order a meal"
    puts "Please enter 'show_basket' to see your current basket"
    puts "Please enter 'show_total' to see your total"
    puts "Please enter 'checkout' to place your order"
  end

  def display_menu
    @menu.display
  end

  def show_basket
    @basket.each do |item|
      item.each do |k, v|
        puts "#{k}, Quantity: #{v}"
      end
    end
  end

  def choose(meal, quantity = 1)
    check_invalid_choice(meal)
    calculate_total(meal, quantity)
    add_to_basket(meal, quantity)
  end

  def show_total
    puts "Your total is £#{@total}"
  end

  def checkout(phone_number)
    fail "You have nothing in your basket!" if @basket.empty?
    send(phone_number, @total) 
  end

  private

  def check_invalid_choice(meal)
    fail "Please choose one of the dishes listed" unless meal <= 8
  end

  def calculate_total(meal, quantity)
    @total += (@menu.items.values[meal - 1] * quantity)
  end

  def add_to_basket(meal, quantity)
    @basket << { @menu.items.keys[meal - 1] => quantity }
  end

  def send(phone_number, total)
    new_sms = SendSMS.new
    new_sms.send(phone_number, total)
  end

end
