require_relative 'menu'

class Restaurant
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

end
