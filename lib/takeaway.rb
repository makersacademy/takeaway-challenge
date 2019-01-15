class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def menu
    @menu.list
  end

end