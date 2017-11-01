require 'sinatra'
require './lib/takeaway'
require './lib/text'


post '/sms' do

  takeaway = Takeaway.new
  number = params['From']
  body = params['Body']

  takeaway.parse_order(body)
  total = takeaway.order[0][:total]

  content_type 'text/xml'
  Text.new.text_response(total)

end