class PlaceOrder

  def ask_for_order
    p "Please place your order in the form of order number, quantity. E.g. '23, 7'"
  end

  def take_order
    $stdin = gets.chomp
  end

  

end
