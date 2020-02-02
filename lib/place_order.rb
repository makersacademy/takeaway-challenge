class PlaceOrder

  def ask_for_order
    p "Please place your order in the form of order number, quantity. E.g. '23, 7'"
  end

  def take_order
    $stdin = gets.chomp
  end

  def ask_for_total
    p "Please write your expected order total below e.g 12.36"
  end

end
