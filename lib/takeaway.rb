# This class is basically pointless
# but I created it to practice dependency injection some more

require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu_class = Menu)
    @menu = menu_class.new

  end

  def show_menu
    @menu.show
  end

  def make_order(order_class = Order)
    order_class.new(@menu)
  end

end

### feature tests

# takeaway = Takeaway.new
#
# takeaway.show_menu

#
# order1 = takeaway.make  _order
# order1.add("starter",5)
# order1.add("main",5)
# puts order1.complete
