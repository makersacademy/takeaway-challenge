require_relative 'menu'

class Restaurant

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

end
