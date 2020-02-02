class PlaceOrder

  attr_accessor :order, :users_total, :total

  def initialize
    @order
    @users_total
    @total
  end

  def ask_for_order
    p "Please place your order in the form of order number, quantity. E.g. '23, 7'"
  end

  def take_order
    $stdin = gets.chomp
    @order = $stdin
  end

  def ask_for_total
    p "Please write your expected order total below e.g 12.36"
  end

  def take_total
    $stdin = gets.chomp
    @users_total = $stdin
  end

  def check_total
    fail "Total incorrect. Order failed" if @users_total != @total

    p "Your order has been placed. Please provide your phone number below."
  end

end
