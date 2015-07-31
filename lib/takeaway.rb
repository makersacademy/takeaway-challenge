class Takeaway
  
  attr_reader :menu, :order
  
  def initialize
    @menu = { :burger => 4, :fries => 2, :coke => 1 }
    @order = []
  end
  
  def show_menu
    menu
  end
  
  def order_item item, quantity = 1
    quantity.times do
      order << menu.select { |choice| choice == item }
    end
  end
end