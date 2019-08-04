class Order
  
  attr_reader :menu, :basket, :order

  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @basket = []
    @order = ""
  end
  def show_menu
    @menu = @menu_class.new
    menu.view
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