class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(resturant, dish, quantity)
    selection = resturant.menu.select { |item| item[:dish] == dish }
    if selection == []
      puts "#{resturant} does not serve this dish"
    else
      puts "#{quantity} #{dish} has been added to your order"
      quantity.times { @basket.push(selection[0]) }
    end
  end

  def total
    t = 0
    @basket.each do |item|
      t += item[:price].to_i
    end
    t
  end

  def complete_order(user_total)
    if user_total == total
      "Your order has been placed"
    else
      "Your total does not match your order, please check again"
    end
  end

end
