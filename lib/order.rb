require 'twilio-ruby'
require 'dotenv/load'
require_relative 'menu'
require_relative 'messager'

class Order

  def view_menu
    convert
    puts menu.menu_list
  end

end
