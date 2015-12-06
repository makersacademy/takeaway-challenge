require_relative 'dish_list'
require 'twilio-ruby'

class OrderList

  extend Forwardable

  def_delegator :@dish_list, :price_list

  attr_reader :client

  def initialize(dish_list)
    @dish_list = dish_list
    account_sid = 'AC052294c8bfb6a8bccf164140b4116340'
    auth_token = '9db8e3404e5865a71a79d28c3ef11e71'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def place_order(total=nil,amount_list)
    fail 'An ordered dish is unavailable' unless ordered_dishes_available?(amount_list)
    fail 'Total does not match sum of dishes in order' unless total == nil || total == dish_sum(amount_list)
    @client.messages.create(
    from:'+441613751762',
    to:'+447747056242',
    body:"Thank you! Your order was placed and will be delivered before #{Time.new.hour+1}:"+ Time.new.strftime("%M")
  )
  end

  private

  def ordered_dishes_available?(amount_list)
    amount_list.keys.all?{|(name)| available_dish_names.include? name }
  end

  def available_dish_names
    @dish_list.dishes.map{|dish| dish.name}
  end

  def dish_sum(amount_list)
    each_dish_payment(amount_list).inject(0){|sum, dish| sum += dish[1] }
  end

  def each_dish_payment(amount_list)
    ordered_price_list(amount_list).merge(amount_list){|key, price, quantity| price * quantity}
  end

  def ordered_price_list(amount_list)
    price_list.delete_if{|key, value| amount_list[key] == nil}
  end

end
