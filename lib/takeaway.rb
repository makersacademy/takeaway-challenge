require_relative 'menu'

class Takeaway
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end 

  def show_menu
    @menu
  end 

  def add_item(item, quantity)
    @basket[item] = quantity 
  end 

end 
