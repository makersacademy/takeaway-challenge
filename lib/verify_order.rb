require 'twilio-ruby'

class VerifyOrder

  TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  TWILIO_VERIFIED_NUMBER = ENV['TWILIO_VERIFIED_NUMBER']
  TWILIO_PHONE_NUMBER = ENV['TWILIO_PHONE_NUMBER']

  def view_basket(basket)
    basket.each do |element|
      puts "#{element["Name"]} : £#{element["Price"]}"
    end
    number_of_items(basket)
    view_total(basket)
    basket
  end

  def text_order_confirmation
    twilio_account_sid = ENV['TWILIO_ACCOUNT_SID']
    twilio_auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_verified_number = ENV['TWILIO_VERIFIED_NUMBER']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

    @client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{time}",
      to: TWILIO_VERIFIED_NUMBER,
      from: TWILIO_PHONE_NUMBER)

    puts message.sid 
  end

  private

  def view_total(basket)
    sum = basket.map do |element|
      element["Price"].to_i
    end.reduce { |total, price| total + price}
    puts "Total cost: £#{sum}"
    sum
  end

  def number_of_items(basket)
    puts "\nNumber of items: #{basket.count}"
  end

  def time
    time = Time.now + 1 * 60 * 60
    time.strftime("%I:%M%p")
  end

end
