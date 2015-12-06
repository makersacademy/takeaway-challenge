class Takeaway
attr_reader :menu, :order

  def initialize
    @menu = { pizza: 6,
              hamburger: 7,
              curry: 5,
              chips: 3,
              cake: 4 }
    @order = []
    @bill = 0
  end

  def add_to_order(dish, quantity)
    @order << [ dish, quantity ]
  end

  def bill_calc
    @order.each { |x| @bill += x[1] * menu[x[0].to_sym] }
    @bill
  end

  def place_order(expected_bill)
    bill_calc
    fail 'bill and expected bill are different' if @bill != expected_bill
    'order successfully placed'
  end
end
