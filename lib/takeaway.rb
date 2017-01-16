require_relative 'menu'
require_relative 'order'
require_relative 'sms'
require 'dotenv'
Dotenv.load

class Takeaway
  attr_reader :basket, :user_telephone
  include Menu, Order, SMS

  def initialize
    @basket = []
    @total = 0
    @message = "text"
  end

  def order(item, number=1)
    number.times{@basket << format_item(item)}
    "#{number} x #{item.upcase} added to basket"
  end

  def clear_basket
    @basket = []
  end

  def total
    @total = 0
    basket.each {|x| x.each {|_key, value| @total += value}}
    puts "Total: £#{format('%.02f', (@total.to_f / 100))}"
  end

  def basket_summary
    return "No items added" if @basket.empty?
    format_basket
  end

  def checkout
    fail "No items in basket" if @basket.empty?
    total
    sms_and_confirm_prompt
    @user_telephone = $stdin.gets.chomp
    @message = generate_sms
    send_sms
    exit
  end

end
