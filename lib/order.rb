require_relative 'menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def get_menu
    puts @menu.print_menu
  end

  # def add_item(item)
    
  # end
end