require_relative 'menu'

class Takeaway

attr_reader :menu

  def initialize(given_menu = Menu.new)
    @menu = given_menu
  end

end
