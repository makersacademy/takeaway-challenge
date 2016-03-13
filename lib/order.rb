class Order

  def initialize menu_ofday
    @current_order = {}
    @menu = menu_ofday
    @bill = 0
  end

  def total_bill
    @bill
  end

  def show_outstanding_order
    @current_order.dup
  end

  def add_dish dish_number , number
    @current_order[@menu.retrieve_dishes[dish_number-1]] = number
    nil
  end

  def update_total
    @bill = 0
    @current_order.each do |dish, quantity|
      @bill += dish.dish_price * quantity
    end
    nil
  end

end
