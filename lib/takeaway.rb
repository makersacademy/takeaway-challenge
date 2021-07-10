require 'menu'

class Takeaway
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def read_menu
    @menu
  end

end
