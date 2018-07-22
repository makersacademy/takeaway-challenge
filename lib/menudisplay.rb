# display class
class MenuDisplay

  def initialize(item, menu, order)
    @item = item
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.dish_list.each_with_index do |n, i|
      print "#{i + 1}: #{n.name.capitalize} - "\
      "#{"%.2f" % (n.price / 100.round(2))}\n"
    end
  end

  def print_basket
    @order.dish_list.each_with_index do |o, i| 
      print "#{i + 1}: #{o.name.capitalize} - "\
      "#{"%.2f" % (o.price / 100.round(2))}\n"
    end
  end

  def print_total
    if @order.total_cost.nil?
      print "Total: 0.00"
    else
      print "Total: #{"%.2f" % (@order.total_cost / 100.round(2))}"
    end
  end

  def print_interface
    print "---------------- Jack's Bistro ---------------\n"
    print_menu
    print "---------------------Basket-------------------\n"
    print_basket
    print_total
    print "\n"
  end

end
