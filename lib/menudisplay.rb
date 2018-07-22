# display class
class MenuDisplay

  def initialize(item, menu, order)
    @item = item
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.dish_list.each_with_index do |n, i|
      print "#{i + 1}: #{n.name} - "\
      "#{"%.2f" % (n.price / 100.round(2))}\n"
    end
  end

  def print_basket

  end

  def print_total

  end

  def print_interface

  end

end
