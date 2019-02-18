class Printer

  def welcome_message(name)
    p "Welcome to #{name}!"
  end

  def receipt(order,total_amount)
    order.each { |dish,quantity| p "#{dish} X#{quantity}" }
    p "Total bill: #{total_amount}"
  end

  def order_update(act, dish, qty)
    act == 'add' ? "Added: #{dish.name}x#{qty}" : "Removed: #{dish.name}x#{qty}"
end
end
