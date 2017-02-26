require_relative 'dish_list'
require 'twilio-ruby'

class Order

  attr_reader :dish_list

  def initialize
    @dish_list = DishList.new
  end

  def show_list_of_all_dishes
    @dish_list.all_dishes
  end

  def finish_order()

  end

  def send_confirmation_text(toNumber)
    account_sid = 'AC9f613d59d88fad7e00230b05302c5e35'
    auth_token = '7c71180c93f745df52a75f7ac7ba1ea2'
    fromNumber = '+441254790495'
    delivery_time = Time.now
    bodyText = "Thank you! Your order was placed and will be delivered before #{(delivery_time.hour + 1)}:#{delivery_time.min}"
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
        :to => "#{toNumber}",
        :from => '+441254790495',
        :body => "#{bodyText}", })
  end
end
