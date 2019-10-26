require_relative 'display'

class Order

  def initialize(display = Display.new)
    @display = display
  end

  def request_menu(restaurant)
    @display.menu(restaurant)
  end

end
