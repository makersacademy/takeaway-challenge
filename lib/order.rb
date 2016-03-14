class Order

  def initialize
    @current_order = {}
    @bill = 0
  end

  def total_bill
    @bill
  end

  def show_outstanding_order
    order = "The current order is:\n"
    @current_order.each do |dish, amount|
      order << "• #{dish.dish_name} x#{amount}: #{dish.dish_price*amount}£\n"
    end
    order << "\n    For a subTotal of #{@bill}£"
    order.tr '_' , ' '
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
