class Order

  attr_reader :order_list

  def initialize(menu = Menu.new)
    @order_list = []
    @menu = menu
  end
  
  def select(dish, quantity)
    fail "This dish has already been ordered" if @order_list.any? { |order| order[:dish] == dish }
    
    @order_list.push({ dish: dish, quantity: quantity })
  end

end
