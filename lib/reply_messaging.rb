require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'

get '/' do
  'Hello world!'
end

# get '/sms-quickstart' do
#   twiml = Twilio::TwiML::MessagingResponse.new do |r|
#     r.message(body: 'Ahoy! Thanks so much for your message.')
#   end

#   twiml.to_s
# end

# send a dynamic reply to incoming text message
post '/sms' do
  # transform request body to lowercase
  body = params['Body'].downcase

  # Build response based on given body param
  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    if body == 'hello'
      resp.message body: 'Hi!
      1. Show menu
      2. Select dishes
      3. Verify order
      4. Submit order'
    elsif body == '1'
      resp.message body: 'Menu:
      1: Onion, Rosemary & Cheddar - 11
      2: Smoked Cod’s Roe, Fermented Cabbage & Caraway - 20
      3: Duck Sausage & Fennel - 25
      4: Nest Soda Bread with Whipped Duck Fat - 10
      5: Beetroot & Smoked Eel - 12
      6: Scottish Langoustine (+£7) - 10
      7: Cornish Halibut, Squid & Mushroom - 8
      8: Goosnagh Duck - 10
      9: Chocolate & Stout - 13
      10: British Cheeses - 15
      11: Homemade Oatcakes - 10
      '
    # elsif body == '2'
    #   resp.message body: 'Select dishes'
    elsif body == 'bye'
      resp.message body: 'Goodbye'
    end
  end

  twiml.to_s
end
