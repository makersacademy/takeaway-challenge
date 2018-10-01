# display class
class MenuDisplay

  def initialize(item, menu, order)
    @item = item
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.dish_list.each_with_index do |n, i|
      puts "#{i + 1}: #{n.name.capitalize} - "\
      "#{"%.2f" % (n.price.to_f / 100.round(2))}"
    end
  end

  def print_basket
    @order.dish_list.each_with_index do |o, i| 
      puts "#{i + 1}: #{o.name.capitalize} - "\
      "#{"%.2f" % (o.price.to_f / 100.round(2))}"
    end
  end

  def print_total
    if @order.total_cost.nil?
      puts "Total: 0.00"
    else
      puts "Total: #{"%.2f" % (@order.total_cost.to_f / 100.round(2))}"
    end
  end

  def print_interface
    print "---------------- Jack's Bistro ---------------\n"
    print_menu
    print "---------------------Basket-------------------\n"
    print_basket
    print_total
  end

end
