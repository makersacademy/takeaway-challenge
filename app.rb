require 'sinatra'
require './lib/takeaway'

takeaway = Takeaway.new

post '/sms' do

  hour_later = ((Time.now)+60*60).strftime('%H:%M')

  number = params['From']
  body = params['Body']

  takeaway.parse_text_order(body)
  total = takeaway.order[0][:total]

  content_type 'text/xml'
  "<Response>
    <Message>
      Your order total is #{total} and you will receive it no later than #{hour_later}. Thank you!
    </Message>
  </Response>" 
end