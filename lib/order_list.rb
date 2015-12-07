require_relative 'dish_list'
require_relative 'personal_details'
require 'twilio-ruby'

class OrderList

  extend Forwardable

  def_delegator :@dish_list, :price_list

  attr_reader :client

  def initialize(dish_list)
    @dish_list = dish_list
    account_sid = PersonalDetails::AccountSid
    auth_token = PersonalDetails::AuthToken
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def place_order(amount_list,total=nil)
    fail 'An ordered dish is unavailable' unless
        ordered_dishes_available?(amount_list)
    fail 'Total does not match sum of dishes in order' unless
       total.nil? || total == dish_sum(amount_list)
    send_text_message
  end

  private

  def ordered_dishes_available?(amount_list)
    amount_list.keys.all?{|(name)| available_dish_names.include? name }
  end

  def available_dish_names
    @dish_list.dishes.map(&:name)
  end

  def dish_sum(amount_list)
    each_dish_payment(amount_list).inject(0){|sum, dish| sum += dish[1] }
  end

  def each_dish_payment(amount_list)
    ordered_price_list(amount_list).merge(amount_list){|_key, price, quantity| price * quantity}
  end

  def ordered_price_list(amount_list)
    price_list.delete_if{|key| amount_list[key].nil?}
  end

  def send_text_message
    client.messages.create(
    from: PersonalDetails::TwiioPhone,
    to: PersonalDetails::PersonalPhone,
    body:"Thank you! Your order was placed and will be delivered before" + delivery_hr_and_min
    )
  end

  def delivery_hr_and_min
    "#{Time.new.hour+1}:"+ Time.new.strftime("%M")
  end

end
