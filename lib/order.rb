require_relative 'twilio_api'
require_relative 'menu'

class Order 
  attr_reader :basket, :menu, :total

  def initialize(menu)
    @menu = menu
    @basket = []
    @total = 0
  end

  def add_dish(choice)
    @basket << @menu.pick_dish(choice)
    @total += @basket.last.price
  end

  def check_total
    @basket.each {|dish| puts "#{dish.name} : #{dish.price}" }
    puts "Added together is #{@total}"
  end

  def complete_order
    @twilio.send_message
  end
end