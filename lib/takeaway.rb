class Takeaway
  def see_menu
    []
  end
  def order dish, quantity = 1
    "#{quantity}x #{dish}(s)"
  end
end