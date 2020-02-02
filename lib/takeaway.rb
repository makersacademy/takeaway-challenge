require_relative "menu.rb"

class Takeaway
  
  def initialize(menu: Menu.new)
    @menu = menu
    @order = {}
  end

  def add(item)
    @order[item] = 1
  end

  def show_menu
    @menu.list
  end

  def order
    @order
  end

end