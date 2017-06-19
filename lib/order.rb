require 'twilio-ruby'
require_relative 'menu'

class Order
  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add(quantity = 1, item)
    selection = search(item)
    add_to_basket(quantity, selection)
    puts quantity.to_s + ' ' + item + ' added to basket!'
  end

  def review_order
    fail "Please add something to your basket!" if basket.empty?
    list_basket
    puts "Your total is £#{calculate_total}."
  end

  def place_order
    puts "Order confirmed"
    sms_notifier
  end

  private

  def search(item)
    fail "Sorry, item not on menu!" unless menu.food_list.has_key?(item)
    menu.food_list.select { |meal, price| meal == item }
  end

  def add_to_basket(quantity, selection)
    while quantity > 0 do
      basket.push(selection)
      quantity -= 1
    end
  end

  def calculate_total
    basket.inject(0) { |sum, item| sum + item.values.first }
  end

  def list_basket
    basket.each { |item| puts "#{item.keys.first} : £#{item.values.first}" }
  end

  def sms_notifier
    account_sid = "" # Replace with your account_sid from Twilio
    auth_token = "" # Replace with your auth token
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create(:body => "Thank you for your order. Your order will be delivered at " + time.to_s + ".",
    :to => "",    # Replace with your phone number
    :from => "")  # Replace with your Twilio number
  end

  def time
    (Time.now + 60*60).strftime("%H:%M")
  end



end
