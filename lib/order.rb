require "twilio-ruby"

account_sid = "ACf8a316836455815bbd78c3da1c655883"
auth_token = "bf4e69a2124af61f71d57ac796724740"
@client = Twilio::REST::Client.new account_sid, auth_token

class Order
  attr_reader :meal, :total_price, :menu
  def initialize(menu = Menu.new)
    @meal = []
    @total_price = 0
    @menu = menu
  end

  def add(dish)
    dish_details = @menu.select(dish)
    fail "I'm sorry we don't have that dish" if dish_details.nil?
    @meal << dish_details[:name]
    @total_price += dish_details[:price]
  end
end
