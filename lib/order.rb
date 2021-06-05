require_relative 'menu'
require_relative 'send_sms'

class Order

  attr_reader :order, :basket, :total_cost

  def initialize(menu = Menu.new, sms = SendSMS.new)
    @menu = menu
    @basket = Hash.new(0)
    @total_cost = 0
    @sms = sms
  end

  def read_menu
    @menu.show_menu
  end

  def add_item(dish, quantity = 1)
    @basket[dish] += quantity 
  end

  def show_basket
    @basket.each do |item, quantity|
      puts "You have #{item} x #{quantity} in your basket"
    end
  end

  def verify
    calculate_total
    "Your total is £#{@total_cost}"
  end

  def confirm
    puts 'Thank you for your order, a text is on its way'
    @sms.send_sms
  end

  private

  def calculate_total
    @basket.each do |item, quantity| 
      @total_cost += @menu.price(item) * quantity
    end
  end

end
