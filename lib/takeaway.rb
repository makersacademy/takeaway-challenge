class Takeaway
  
  def initialize(menu: Menu.new)
    @menu = menu
    @order = {}
  end

  def add(item)
    @order[item] = 1
  end

  def show_menu
    @menu
  end

  def order
    @order
  end

end