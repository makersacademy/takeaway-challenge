require_relative 'menu.rb'
require_relative 'send_sms.rb'
require 'dotenv'
Dotenv.load

class Restaurant
  attr_reader :menu
  attr_reader :basket

  def initialize(menu = Menu.new, sender = SendSMS.new)
    @menu = menu
    @sender = sender
    @basket = {}
  end

  def show_menu
    menu.list
  end

  def order(dish, portions = 1)
    fail "Sorry, #{dish} aren't on the menu" unless menu.list.include?(dish)

    if @basket.include? dish
      @basket[dish] += portions
    else @basket.store(dish, portions)
    end
    return "#{portions} portion/s of #{dish} added to your basket"
  end

  def basket_summary
    arr = []
    basket.each do |dish, portions|
      arr << "#{portions} portions of #{dish} @ £#{"%.2f" % menu.list[dish]} each = £#{"%.2f" % (portions * menu.list[dish])}, "
    end
    arr.join.chomp(", ")
  end

  def total
    count = 0
    basket.each do |dish, portions|
      count += (portions * menu.list[dish])
    end
    count
  end

  def show_total
    "Total owing: £#{"%.2f" % total}"
  end

  def checkout(payment)
    fail "Insufficient payment" if payment < self.total

  # In real life, some code here to collect the customer's mobile number 
    # so we can pass it to confirmation
    "Thanks, you'll get an SMS confirmation"
    confirmation(ENV['MOB_NUM']) 

  end

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

  private
  def confirmation(to)
    @sender.send(to, "Thank you! Your order for #{basket_summary}, (TOTAL ORDER VALUE: £#{"%.2f" % total}) was placed and will be delivered before #{delivery_time}")
  end
end
