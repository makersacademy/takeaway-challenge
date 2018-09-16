class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add(resturant, dish, quantity)
    selection = resturant.menu.select { |item| item[:dish] == dish }
    if selection == []
      puts "#{resturant} does not serve this dish"
    else
      puts "#{quantity} #{dish} has been added to your order"
      quantity.times { @order.push(selection[0]) }
    end
  end

end
