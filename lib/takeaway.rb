require_relative 'menu'
require_relative 'order'
require_relative 'sms'
require 'dotenv'
Dotenv.load

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
    puts "Total cost of order: £#{format('%.02f', (@total.to_f / 100))}, \n
    Please enter mobile number and press enter/return to order"
    @user = $stdin.gets.chomp
    @message = "Thank you for your order"
    send_sms(message)
  end


end
