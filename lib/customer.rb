
class Customer 

  def place_order(order)
    order.downcase!
    return order.gsub(/\s/, "").split(",") if order.include?(",")
    order.split(" ")
  end

end