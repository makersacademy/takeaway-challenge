require 'dotenv/load'
require_relative 'menu'
require_relative 'sms'

class Order
  attr_reader :current_total

  def initialize
    @current_total = 0
    @menu = Menu.new
    @sms = Sms.new
  end

  def add(list, customer_number)
    add_up_given(list)
    fail 'Incorrect total' if incorrect?(list[:total])
    confirm_order(customer_number)
  end

  private

  def add_up_given(list)
    list.each do |dish, amount|
      @current_total += @menu.prices[dish].to_f * amount.to_f
    end
  end

  def incorrect?(given_total)
    @current_total != given_total
  end

  def confirm_order(number)
    @sms.send(number)
  end

end
