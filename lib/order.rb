class Order

  attr_reader :current_order, :menu, :bill

  def initialize menu_ofday
    @current_order = {}
    @menu = menu_ofday
    @bill = 0
  end

  def add_dish dish_number , number
    @current_order[@menu.retrieve_dishes[dish_number-1]] = number
  end

  def update_total
    @current_order.each do |dish, quantity|
      @bill += dish.dish_price * quantity
    end
  end

end
