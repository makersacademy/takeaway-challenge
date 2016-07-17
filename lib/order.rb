class Order

attr_reader :current_order, :total_bill, :delivery_time, :order_time

def initialize
  @current_order = []
  @total_bill = 0
  @delivery_time = 0
  @order_time = 0
end

def place_order(*dish)
  @current_order += dish
  find_order_time
  find_delivery_time
  find_total_bill
end

private

def find_order_time
  @order_time = Time.new
end

def find_delivery_time
  @delivery_time = @order_time + (30*60)
  @delivery_time = "#{'%02d' % delivery_time.hour}:#{'%02d' % delivery_time.min}"
end

def find_total_bill
  @current_order.each do |dish|
    @total_bill += dish.price
  end
  @total_bill
end

end
