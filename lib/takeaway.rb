require_relative 'menu'

class Takeaway

  def initialize(menu: Menu.new)
    @menu = menu
  end

end
