class Takeaway

  def collect
    @items ||= []
  end

  def add_order(dishes, quantity)
    collect << dishes.price * quantity
  end

  def total_price
    @items.reduce{ |sum, item| sum + item }
  end

  def time
    t = Time.now + (60*60)
    t.strftime("%H:%M")
  end

  def checkout(input)
    if input == total_price
      "Your order has been accepted, your meal will be with you at #{time}"
    else
      "Sorry your amount is not correct"
    end
  end

end
