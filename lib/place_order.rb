class PlaceOrder

  attr_accessor :order, :users_total, :total, :phone_number

  def initialize
    @order
    @users_total
    @total
    @phone_number
  end

  def ask_for_order
    p "Please place your order in the form of order number, quantity. E.g. '23, 7'"
  end

  def take_order
    @order = gets.chomp
  end

  def ask_for_total
    p "Please write your expected order total below e.g 12.36"
  end

  def take_total
    @users_total =  gets.chomp
  end

  def total_agreed?
    @users_total == @total
  end

  def confirm_order
    fail "Total incorrect. Order failed" if total_agreed? == false

    p "Your order has been placed. Please provide your phone number below."
  end

  def take_number
    @phone_number = gets.chomp
  end

end
