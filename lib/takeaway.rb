require_relative 'menu'

class Takeaway

  attr_reader :view_menu

  def initialize(menu)
    @view_menu = menu
  end

end
