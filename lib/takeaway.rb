class Takeaway

  def initialize(menu=Menu.new)
    @basket = {}
    @menu = menu
  end

  def basket
    @basket.dup
  end

  def show_menu
    @menu.display.dup
  end
end
