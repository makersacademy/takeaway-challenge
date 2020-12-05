require_relative 'menu'

class Takeaway

  def initialize(menu = Menu)
    @menu = menu.new
  end

  def place_order
    @menu.check_total
  end

end