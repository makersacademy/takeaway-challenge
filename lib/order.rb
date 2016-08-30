class Order
  attr_reader :menu, :bill

  NOT_AVAILABLE_ERROR = "Dish isn't available to order."

  def initialize(menu = Menu.new)
    @menu = menu
    @bill = []
  end

  def add(dish)
    fail NOT_AVAILABLE_ERROR unless menu.has_dish?(dish)
    bill << dish
  end

  def total
    bill.reduce(0) { |sum, d| sum + d.price }
  end

  def finalise(takeaway = Takeaway.new)
    takeaway.send_text
  end
end
