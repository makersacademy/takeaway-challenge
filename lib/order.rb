require 'twilio-ruby'
require 'dotenv/load'
require_relative 'menu'
require_relative 'messager'

class Order

  def load_menu(filename)
    menu = Menu.new
    menu.load_from_csv(filename)
    puts menu.menu_list.to_s
  end

end
