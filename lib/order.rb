require_relative 'menu'

class Order

  BILL = 0

  attr_accessor :menu, :full_order, :bill

  def initialize(bill = BILL)
    @full_order = []
    @bill = bill
    @menu = Menu::MENU
  end

  def add(dish, quantity = 1) #to full_order
    raise "This item is not on the menu" unless on_menu?(dish)
    quantity.times { @full_order << dish }
    quantity.times { @bill += @menu[dish] }
  end

  def total_correct?
    count = 0
    @full_order.each { |dish| count += @menu[dish] }
    @bill == count 
  end

private
  def on_menu?(dish) # move to menu class...
    @menu.has_key?(dish)
  end

end
