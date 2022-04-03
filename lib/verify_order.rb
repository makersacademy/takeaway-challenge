require 'twilio-ruby'

class VerifyOrder

  def view_basket(basket)
    basket.each do |element|
      puts "#{element["Name"]} : £#{element["Price"]}"
    end
    puts "\nNumber of items: #{basket.count}"
    puts view_total(basket)
  end

  def text_order_confirmation
    twilio_account_sid = ENV['TWILIO_ACCOUNT_SID']
    twilio_auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_verified_number = ENV['TWILIO_VERIFIED_NUMBER']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

    @client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{time}",
      to: twilio_verified_number,
      from: twilio_phone_number)

    puts message.sid 
  end

  private

  def view_total(basket)
    sum = basket.map do |element|
      element["Price"].to_i
    end.reduce { |total, price| total + price}
    puts "Total cost: £#{sum}"
  end

  def time
    time = Time.now + 1*60*60
    time.strftime("%I:%M%p")
  end

end
