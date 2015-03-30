class Print
  def check(order)
    order.items.each { |dish, price| puts "#{dish}  -  #{price}" }
    puts "Total Items #{order.total_items}"
    puts "Total Cost #{order.cost}"
  end

  def read(menu)
    puts "Takeaway Menu"
    menu.items.each { |key, (dish, price)| puts "#{key}. #{dish} - £#{price}" }
  end
end
