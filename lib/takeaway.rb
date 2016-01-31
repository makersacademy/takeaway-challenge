require_relative 'menu'

class Takeaway

  attr_reader :menu
  attr_reader :basket

  def initialize(menu_klass = Menu)
    @menu = menu_klass.new
    @basket = {}
  end

  def show_menu
    @menu.dishes.dup
  end

  def order(item, number=1)
    @basket["#{item} x#{number}"] = @menu.price(item) * number
    "You ordered #{item} x#{number}"
  end

end
