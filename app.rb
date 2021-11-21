require 'sinatra/base'
# require 'sinatra/reloader'

class TakeAwayApp < Sinatra::Base
  # configure :development do
  #   register Sinatra::Reloader
  # end

  get '/' do
    'Welcome to Take Away App'
    redirect '/ui'
  end

  get '/ui' do
    erb :user_interface
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
