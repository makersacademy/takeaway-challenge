class Takeaway

  attr_accessor :menu, :orders

  def initialize
    @menu = {:Fish => 5, :Meat => 7}
    @orders = [] #could be an object >> see how emerges
  end

  def list_menu
    p menu
  end

  def add_order_item item, quantity = 1
    quantity.times do
      orders << menu.select{|k,v| k == item}
    end
  end
end