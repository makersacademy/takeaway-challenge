require './lib/menu.rb'
class Order 

    attr_reader :order, :menu

  def initizialize 
    @order = Hash.new(0)
    @menu = Menu.new
  end 

  def view_menu
    menu.view
  end 
end 