class Takeaway

  attr_reader :menu

  def initialize(menu_class)
    @menu = menu_class.new
  end

  def show_menu

  end

  def place_order

  end

end
