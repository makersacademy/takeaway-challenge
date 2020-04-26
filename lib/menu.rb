require './lib/dish_list'
require 'twilio-ruby'

class OrderMenu
  attr_reader :basket, :dish_list

  #Dependency Injection!
  def initialize(dish_list = DishList.new)
    @dish_list = dish_list
    @basket = Array.new
    @current_selection = Hash.new
    set_twilio
  end

  def print
    @dish_list.dishes.each { |dish| puts dish }
  end

  def enter_selection(item, quantity)
    raise "error" unless available?(item)
    add_to_basket(quantity)
    @current_selection = Hash.new
  end

  def place_order(sum)
    check(sum)
  end

  def total
    sum = 0
    @basket.each { |selection| sum += (selection["item"].price * selection["quantity"]) }
    sum
  end

  private
  #Move to twilio object?
  def set_twilio
    account_sid = "AC17c7f225973a0fdaf83cf81958edf728"
    auth_token = "6649eb8f7774da59af92a9a9eda153a0"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  #Move to twilio object?
  def send_confirmation_text
    message = "Thank you! Your order was placed and will be delivered before #{get_eta}"
    @client.messages.create(
      body: message,
      to: "+44 7919 912139",
      from: "+18452500895")
  end

  #Move to order object?
  def available?(item)
    @dish_list.dishes.each do |dish|
      @current_selection["item"] = dish if dish.item == item
    end
    !@current_selection["item"].nil?
  end

  #Move to order object?
  def add_to_basket(quantity)
    @current_selection["quantity"] = quantity
    @basket << @current_selection
  end

  #Move to order object?
  def check(sum)
    total == sum ? send_confirmation_text : (raise "error")
  end

  #Move to twilio object?
  def get_eta
    time = Time.now
    hour_ahead = time + (60 * 60)
    hour_ahead.strftime("%k:%M")
  end
end
