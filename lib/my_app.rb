require 'sinatra'
require_relative 'meal_list'
require_relative 'meal'
require_relative 'order'
require 'json'
require 'pry'

get '/' do
  'Hello world!'
end

post '/' do 
  body = request.params["Body"]
  account_sid = ENV['AC_SID']
  auth_token = ENV['TWIL_TOKEN']
  order = Order.new(body)
  puts "body : #{body} "
  puts "order : #{order}"
  # @client = Twilio::REST::Client.new account_sid, auth_token
  # message = @client.messages.create(
  #     body: "#{order.to_s}",
  #     to: ENV['MY_NUMBER'],   
  #     from: ENV['TWILIO_NUMBER']) 
end