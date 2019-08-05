class Order
  
  attr_reader :basket, :order

  def initialize
    @basket = []
    @order = ""
  end

  def add(dish, quantity)
    fail 'Item not on menu' unless Menu.new.dishes.include? :"#{dish}"
    quantity.times { @basket << dish }
    "#{dish} has been added to the basket #{quantity}x"
  end
  
  def remove(dish)
    fail 'Basket empty' if basket.empty?
    fail 'Item not in basket' unless basket.include? dish
    basket.delete(dish)
    "#{dish} has been removed from the basket"
  end

  def view_order
    basket.each do |x| 
      quantity = basket.count("#{x}")
      unless order.include? x
        order << "#{x} x#{quantity} = £#{ quantity * (Menu.new.dishes.fetch(:"#{x}")) }0, "
      end
    end
    order
  end

end   

# Responsible for the ordering process.