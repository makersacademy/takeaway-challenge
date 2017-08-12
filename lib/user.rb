require_relative './menu.rb'

class User

  attr_accessor :basket, :menu

  def initialize
    @menu = Menu.new.show_menu_hash
    @basket = []
  end

end
