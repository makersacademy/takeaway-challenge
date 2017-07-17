class Order

attr_reader :dish, :payment, :menu

  def initialize(menu, dish)
    @menu = menu
    @dish = dish[0]
    @payment = dish[1]

  end

  def calculate_total #fails 
    total = 0
    dish.each{|mains, quantity| total += dish[mains] * quantity}

    total
  end

  def check_payment
     fail "Incorrect payment amount" unless payment_correct?
  end

  def payment_correct?
     payment == calculate_total
  end

  def send_message
    "Thank you for your order!."
  end



end
