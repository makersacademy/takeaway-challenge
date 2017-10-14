require_relative 'menu'

class Takeaway

  attr_reader :menu, :order_subtotal

  def initialize(menu = Menu.new)#(menu = Menu.new)
    @menu = menu #(@menu = menu)
    @order_subtotal = {}
  end

  def read_menu
    @menu.dishes
  end

  def order(menu_item)
    @menu.dishes.each_pair do |k, v|
      if k == menu_item
        order_subtotal.store(k, v)
      end
    end
  end

  def order_summary
    puts order_subtotal
  end

  #def print_menu
    #(@)menu.print
  #end

end

#dependency injection is used for classes
#are likely to change.

# t = Takeaway.new
# t.order('Rock Cakes')
# t.order('Cockroach Clusters')
# p t.order_subtotal
