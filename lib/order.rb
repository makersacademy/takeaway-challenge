class Order

  attr_reader :order_list

  def initialize(menu = Menu.new)
    @order_list = []
    @menu = menu
  end
  
  def select(dish, quantity)
    fail "This dish has already been ordered" if @order_list.any? { |order| order[:dish] == dish }
    fail "This dish is not in the menu" unless @menu.include? dish
    
    @order_list.push({ dish: dish, quantity: quantity })
  end

  def place(total)
    fail "The total does not match the sum of the various dishes" if total != total_number_of_dishes
  end

  private

  def total_number_of_dishes
    @order_list.reduce(0) { |sum, item| sum + item[:quantity] }
  end

end
