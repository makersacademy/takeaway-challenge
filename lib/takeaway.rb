class TakeAway
  attr_reader :menu
  def initialize(menu = Menu.new)
    @menu = menu.menu
  end

  def seemenu
    return @menu
  end

  def order(*args)
  end

end
