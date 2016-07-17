class Order

attr_reader :current_order, :total_bill

def initialize
  @current_order = []
  @total_bill = 0
end

def place_order(*dish)
  @current_order += dish
end

def calculate_total
  @current_order.each do |dish|
    @total_bill += dish.price
  end
  total_bill
end



end
