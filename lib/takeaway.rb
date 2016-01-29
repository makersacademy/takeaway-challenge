class Takeaway
  def initialize(menu)
    @select = {}
    @menu = menu
    @estimate = 0
  end

attr_reader :menu, :estimate

  def show_menu
    menu.show
  end

  def select(order, estimate)
    @estimate = estimate
    @select = order

  end

  def correct_bill?
    raise "incorrect bill amount" unless calculate_bill == estimate
    confirm_order
  end 

  def confirm_order
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

  def delivery_time
    (Time.now + 24*60*60).strftime("%H:%M")
  end

  def calculate_bill
    bill = 0
    @select.each {|k, v| bill += show_menu[k]*v}
    bill  
  end
end