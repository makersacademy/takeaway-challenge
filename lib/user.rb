require_relative "Menu"
require_relative "twilio_api.rb"

class User

include Messenger

  attr_reader :basket, :total, :menu

  def initialize
    @basket = []
    @total = 0
    @menu = Menu.new
  end

  def add(item)
    @basket << item[0]
    @total += item[1]
  end

  def checkout(input)
    fail "Error - Payment value does not match basket total" unless input == @total
    puts "#{basket.length} items in your basket, total £#{total}"
    puts "Hit enter to proceed, else CTRL-C to abort."
    $stdin.gets.chomp
    self.checkout_complete
    puts "Order placed!"
  end

  def checkout_complete
    time = Time.new + 3600
    sendMessage("Thank you! Your order was placed and will be delivered #{time.strftime("at %H:%M")}", "+447866856308")
  end

end

