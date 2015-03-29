class Print
  def check(order)
    order.items.each { |dish, price| puts "#{dish}  -  #{price}" }
    puts "Total Items #{order.total_items}"
    puts "Total Cost #{order.cost}"
  end
end
