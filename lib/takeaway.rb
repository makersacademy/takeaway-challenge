require 'rubygems'
require 'twilio-ruby'

class Takeaway
  attr_reader :orders

  def initialize
    @orders = []
  end

  def list
    "1 Kappa Maki => £8
     2 Edamame => £5
     3 Vegan Spring Rolls => £6
     4 Vegetarian Potstickers => £6
     5 Sesame Seaweed Salad => £8"
  end

  def order(dish_number)
    dishes = [{"Kappa Maki" => 8},
              {"Edamame" => 5},
              {"Vegan Spring Rolls" => 6},
              {"Vegetarian Potstickers" => 6},
              {"Sesame Seaweed Salad" => 8}]

    orders << dishes[dish_number - 1]
  end

  def total
    calculate_total
  end

  def send_sms
    sms_message
  end

  private

  def calculate_total
    sum = orders.map do |orders|
      orders.values
    end
    sum.flatten.sum
  end

  def time
    t = Time.now
    t + (60 * 60)
  end

  def sms_message
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
     .create(
        body: "Thank you! Your order was placed and will be delivered before #{time}\nYour total is £#{total}",
        from: '+441582380213',
        to: ENV["PHONE_NUMBER"]
      )

    puts message.sid
  end
end
