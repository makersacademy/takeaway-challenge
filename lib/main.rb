# The User Interface
require_relative 'menu'
require_relative 'order'
require_relative 'payment'
require_relative 'receipt'

def run_take_away_challenge
  menu = Menu.new
  menu.load_menu
  menu.display_menu
end

run_take_away_challenge
