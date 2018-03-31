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
  body = JSONE.parse(request.params["Body"])
  account_sid = ENV['AC_SID']
  auth_token = ENV['TWIL_TOKEN']
  order = Order.new(body)
  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
      body: "#{body}",
      to: ENV['MY_NUMBER'],   
      from: ENV['TWILIO_NUMBER']) 
end