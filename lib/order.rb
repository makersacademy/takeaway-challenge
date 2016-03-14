class Order

  def initialize
    @current_order = {}
    @bill = 0
  end

  def total_bill
    @bill
  end

  def show_outstanding_order
    @current_order.dup
  end

  def add_dish dish , amount
    @current_order[dish] = amount
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
