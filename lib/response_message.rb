require 'twilio-ruby'
require 'sinatra'
require_relative 'menu'
require 'pp'
get '/sms' do
  # parses it and lowercases it

  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    resp.message(body: "Thanks for your message! Someone on our team will go over your order and send you a text when it's ready.")
  end

  twiml.to_s
end

get '/unique-response' do
  menu = Menu.new
  @total = 0
  @time = Time.now + 3600
  body = params['Body'].downcase
  # if body == menu.current_menu[body]
  #   food = menu.current_menu.key(price)
  #   price = menu.current_menu[body]
  # end

  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    if body == "menu"
      resp.message body: "Here is our current menu:\n#{menu.formatted_menu}. \nPlease select a dish."
    elsif body == "pelmeni"
      resp.message body: "Good choice. Pelmeni will be £6.99. Text 'total' to see your total."
      @total + 6.99
    elsif body == "tvarog"
      resp.message body: "Delicious choice. Tvarog will be £3.99. Text 'total' to see your total."
      @total + 3.99
    elsif body == "borscht"
      resp.message body: "The best choice. Borscht will be £5.99. Text 'total' to see your total."
      @total + 5.99
    elsif body == "olivier"
      resp.message body: "Tasty! Olivier will be £4.99. Text 'total' to see your total."
      @total + 4.99
    elsif body == "salat"
      resp.message body: "Super healthy. A Salat will be £1.99. Text 'total' to see your total."
      @total + 1.99
    elsif body == "blinchiki"
      resp.message body: "I love the way you think. Blinchikis will be £9.99. Text 'total' to see your total."
      @total + 9.99
    elsif body == "total"
      resp.message body: "Your total will be £17.99. Text 'place order' to place your order!"
    elsif body == "place order"
      resp.message body: "Spacibo! Your order will be with you at around #{@time.strftime("%H:%M")}.🇷🇺😄"
    else
      resp.message body: "Sorry, didn't get that. Type 'menu' to try again, or see 'total' if you have begun to order."
    end
  end

  twiml.to_s
end