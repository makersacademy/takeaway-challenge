class Billing

  def total(order)
    total = 0
    order.each do | x , y |
      total += x[:price]
    end
    total
  end
end
