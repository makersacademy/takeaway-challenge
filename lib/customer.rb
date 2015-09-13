class Customer

  def order restaurant, dish, amount
    restaurant.take_order dish, amount
  end

  def confirm_total restaurant, total
    restaurant.confirm_order total
  end
end
