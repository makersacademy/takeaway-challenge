class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def menu
    @menu.see
  end
end
