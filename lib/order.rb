require_relative 'menu'
require_relative 'dish'
require_relative 'text'
require 'twilio-ruby'

class Order
  attr_reader :basket, :menu, :phone_number

  def initialize(menu)
    @menu = menu
    @basket = []
  end

  def list_menu
    menu
  end

  def add(dish, amount = 1)
    fail "Sorry, #{dish} is not on our menu." unless @menu.dishes.include?(dish)
    @basket.push({ dish: dish, amount: amount })
  end

  # def delete(dish, amount = 1)
  #   fail "#{dish} is not in your basket" unless basket.map { |item| item[:dish] }.include?(dish)
  #   @basket.delete({ dish: dish, amount: amount })
  #
  # end

  def wipe_basket
    @basket.clear
  end

  def list_basket
    raise 'Basket is empty' if @basket.empty?
    @basket.each do |item|
      puts "#{item[:amount]} portions of #{item[:dish].dish_name}"
    end
  end

  def total
    raise 'basket is empty' if @basket.empty?
    @basket.map { |item| item[:amount] * item[:dish].price }.reduce(:+)
  end

  def check_total(expected_total)
    bill = @basket.map { |item| item[:amount] * item[:dish].price }.reduce(:+)
    raise "Sorry, your total is £#{bill}, not £#{expected_total}" if expected_total != bill
    "Your order totals to £#{bill}"
  end

  def confirm
    text = Text.new
  end
end
