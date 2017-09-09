require_relative 'menu.rb'

class Restaurant

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end
end
