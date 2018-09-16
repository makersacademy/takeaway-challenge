require 'sinatra'
require 'twilio-ruby'

require_relative 'menu'
require_relative 'sms_processors'

post '/sms-takeaway-challenge' do

  body = params['Body']
  menu = Menu.new
  sms_process = SMSProcess.new

  twiml = Twilio::TwiML::MessagingResponse.new do 
    if body == 'Menu'
      menu.see_sms
    else
      # expected format eg "Butterbeer, 2, 6"
      dish_quantity_list = sms_process.break_up_input(body)
      dish_quantity_array = sms_process.format_dish_input(dish_quantity_list)
      sms_process.add_dishes_to_order(dish_quantity_array, menu)
      sms_process.price_check(menu)
    end
  end

  twiml.to_s

end
