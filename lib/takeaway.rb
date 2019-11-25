
class Takeaway
  attr_reader :basket, :menu

  def initialize
    @menu = Menu.new
    @basket = []
    
  end

def display_menu
  @menu.display
end


def select_dish(num, qty = 1)
  qty.times {@basket << @menu.items.keys[num - 1]}
end
end