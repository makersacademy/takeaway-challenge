class TakeAway
attr_reader :menu
  def initialize()
    @menu = Menu.new.menu
  end

  def seemenu
    return @menu
  end

  def order
  end

end
