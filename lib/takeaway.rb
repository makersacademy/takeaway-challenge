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
    true
  end 

  def calculate_bill
    bill = 0
    @select.each {|k, v| bill += show_menu[k]*v}
    bill  
  end
end