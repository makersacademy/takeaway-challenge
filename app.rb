require 'sinatra'
require './lib/takeaway'
require './lib/text'

$takeaway = Takeaway.new

post '/sms' do

  body = params['Body']

  body.casecmp('menu').zero? ? send_menu : confirmation_text(body)

end

def confirmation_text(body)
  $takeaway.parse_order(body)
  total = $takeaway.order[0][:total]

  content_type 'text/xml'
  Text.new.text_response(total)
end

def send_menu
  content_type 'text/xml'
  Text.new.send_menu($takeaway.print_menu)
end
