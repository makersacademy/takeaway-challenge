require 'csv'
require_relative 'order'
require 'twilio-ruby'

class Dishes

  def initialize(order = Order.new)
    @order = order
    @dishes = {}
    open_menu
  end

  def open_menu(filename = "./lib/list_of_dishes.csv")
    contents = CSV.open(filename, headers: true, header_converters: :symbol)
    contents.each_with_index do |row, index|
      food_type = row[:food_type]
      name = row[:name]
      price = row[:price]
      @dishes[index + 1] = {"Name" => name, "Price" => price}
    end
    contents.close
  end

  def view_menu
    @dishes.each_with_index do |(key, value), index|
      puts "#{key}. #{value["Name"]} : £#{value["Price"]}"
    end
  end

  def choose_dish(order_no)
    @order.add_to_basket(@dishes[order_no])
  end

  def check_basket
    @order.view_basket
  end

  def time
    time = Time.now + 1*60*60
    time.strftime("%I:%M%p")
  end

  def test

twilio_account_sid = ENV['TWILIO_ACCOUNT_SID']
twilio_auth_token = ENV['TWILIO_AUTH_TOKEN']
twilio_verified_number = ENV['TWILIO_VERIFIED_NUMBER']
twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

@client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token
message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{time}",
    to: twilio_verified_number,    # Replace with your phone number
    from: twilio_phone_number)  # Use this Magic Number for creating SMS

puts message.sid 

end

end

