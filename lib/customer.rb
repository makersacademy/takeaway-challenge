class Customer

  attr_reader :name, :tel_no, :restaurant_bill

  def initialize name, tel_no
    @name = name
    @tel_no = tel_no
  end

  def bill_correct? restaurant
    find_order restaurant
    calculate_bill == @restaurant_bill
  end

  private

  def find_order restaurant
    @my_order = nil
    @restaurant_bill = nil
    restaurant.orders.clone.select.with_index do |ord, ind|
      if ord.customer == self
        @my_order = restaurant.orders[ind]
        @restaurant_bill = @my_order.total
      end
    end
    fail "No order found" unless @my_order
  end

  def calculate_bill
    @my_order.order_details.map {|i| @my_order.menu.list_items[i]}.inject(:+)
  end

end
