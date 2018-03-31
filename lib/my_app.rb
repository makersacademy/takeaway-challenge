require 'sinatra'
require_relative 'meal_list'
require_relative 'meal'
require_relative 'order'

get '/' do
  'Hello world!'
end

post '/' do 
  body = request.params["Body"]
  puts body
end