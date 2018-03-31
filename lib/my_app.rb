require 'sinatra'
require_relative 'order'

post '/' do
  account_sid = ENV['AC_SID']
  auth_token = ENV['TWIL_TOKEN']
  body = eval(request.params["Body"])
  order = Order.new(body)
  order.place_order
end
