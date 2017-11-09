require 'sinatra'
require './lib/takeaway'
require './lib/text'

$takeaway = Takeaway.new

before do
  @takeaway = Takeaway.store(Takeaway.new)
end

post '/sms' do

  body = params['Body']

  body.casecmp('menu').zero? ? send_menu : confirmation_text(body)

end

def confirmation_text(body)
  @takeaway.instance.parse_order(body)
  total = @takeaway.instance.order[0][:total]

  content_type 'text/xml'
  Text.new.text_response(total)
end

def send_menu
  content_type 'text/xml'
  Text.new.send_menu(@takeaway.instance.print_menu)
end
