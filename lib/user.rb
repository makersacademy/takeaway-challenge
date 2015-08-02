#require_relative 'List'
require 'twilio-ruby'

class User

  attr_accessor :food_menu, :food_order
  attr_reader :phone

  def initialize user_phone
    @phone = user_phone
  end

  def show_menu
    @food_menu = List.new
    food_menu.load_predefined_dishes
  end

  def select_food_to_order *dishes
    dishes.each { |dish| food_menu.select_food_order dish }
    food_menu.food_order
  end

  def place_food_order
    food_menu.food_order.clear
    send_sms
  end

private
      def send_sms
        account_sid = 'AC98d3efd00c4a9a7bbb98fc8f86d2308a'
        auth_token = '7872f37eb4c6ff5b8dd181d98f99a4ba'
        @client = Twilio::REST::Client.new account_sid, auth_token
        @client.account.messages.create({
          :from => '+441761502062',
          :to => '+447496548640',
          :body => 'Thank you! Your order was placed and will be delivered before ' + delivery_time_formatted
        })
      end

      def delivery_time
        t = Time.now
        t.strftime("%H:%M")
      end

      def delivery_time_formatted
        add_one_hour = delivery_time[0..1].to_i + 1
        add_one_hour.to_s + delivery_time[2..4]
      end
end


