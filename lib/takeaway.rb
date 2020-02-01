class Takeaway
  
  def initialize(menu: Menu.new)
    @menu = menu
  end

  def order(item)
    item
  end

  def show_menu
    @menu
  end

end