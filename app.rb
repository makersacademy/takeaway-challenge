require 'sinatra/base'
# require 'sinatra/reloader'
require_relative './lib/menu_data'
require_relative './lib/setup_database'

class TakeAwayApp < Sinatra::Base
  # configure :development do
  #   register Sinatra::Reloader
  # end
  #
  p 'in App'
  setup_env_database
  get '/' do
    'Welcome to Take Away App'
    redirect '/ui'
  end

  get '/ui' do
    @menu = MenuData.fetch_menu
    erb :user_interface
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
