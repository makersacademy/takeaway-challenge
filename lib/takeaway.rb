class Takeaway

  require_relative './menu'

  def initialize
    @menu = Menu.new
  end

  def menu
    @menu.print
  end

end
