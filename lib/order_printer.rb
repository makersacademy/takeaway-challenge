
class OrderPrinter

  def output_for(basket)
    basket.each {|dish, quant| puts "Dish: #{dish} X#{quant}."}
  end

  def output_(total)
    print "Total cost: #{total}"
  end

end
