require_relative 'menu.rb'

class Restaurant
  attr_reader :menu
  def initialize
    @menu = Menu.new
  end

  def show_menu
    menu.list
  end
end
