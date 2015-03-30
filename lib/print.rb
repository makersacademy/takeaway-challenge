class Print
  def check(order)
    order.items.each { |dish, p| puts "#{dish}  -  £#{p[0]} x #{p[1]}" }
    puts "Total Items #{order.total_items}"
    puts "Total Cost #{order.cost}"
  end

  def read(menu)
    puts "Takeaway Menu"
    menu.items.each { |key, (dish, price)| puts "#{key}. #{dish} - £#{price}" }
  end
end
