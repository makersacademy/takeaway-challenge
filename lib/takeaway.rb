require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway
  attr_reader :basket, :total, :user, :message
  include Menu, Order, SMS

  def initialize
    @basket = []
    @total = 0
  end

  def order(item, number=1)
    number.times{@basket << add_to_order(item)}
    "#{number} x #{item.upcase} added to basket"
  end

  def total
    calculate_total
  end

  def basket_summary
    return "No items added" if @basket.empty?
    format_basket
  end

  def checkout
    fail "No items in basket" if @basket.empty?
    puts "#{total} - Please enter phone number and press enter order"
    @user = $stdin.gets.chomp
    @message = "Thank you for your order"
    send_sms(message)
  end


end
