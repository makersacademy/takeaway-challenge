class Takeaway

  def create_bill(order_array)
    price = order_array.inject { |acc, num| acc + num }
  end

end