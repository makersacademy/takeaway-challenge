require_relative 'menu'
# require 'rubygems'
# require 'twilio-ruby'
# require 'dotenv'
# Dotenv.load
class Takeaway
  attr_reader :menu, :current_order
  def initialize(menu: Menu.new)
    @menu = menu
    @current_order = []
    @cost = []
    @current_total = 0
  end

  def see_menu
    @menu.menu_list
  end

  def order(item)
    fail "No such dish here!" unless see_menu.include?(item)
    @menu.menu_list.select do |k , v |
    @current_order <<  {k => v} if k == item
    @cost << see_menu[item]
    total_pay
    end
    @current_order
  end

  def checkout(total_pay)
    @current_order.each do |item|
    @current_total += see_menu[item.key[0]]
    end
    fail "the total is not correct" if @current_total != total_pay
    send_sms
  end

  private
  def total_pay
    @cost.inject(0){|sum,x| sum + x }
  end
  def send_sms
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => from,
      :to => to,
      :body => "Thank you for the order! It will be de delivered by #{Time.new.hour + 1}:#{Time.new.min}",
    })

   end
end
