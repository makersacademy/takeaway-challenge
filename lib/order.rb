require_relative 'menu'
require_relative 'text'

class Order

  BILL = 0

  attr_accessor :menu, :full_order, :bill

  def initialize(bill = BILL)
    @full_order = []
    @bill = bill
    @menu = Menu::MENU
    @text = Text.new
  end

  def add(dish, quantity = 1)
    raise "This item is not on the menu" unless on_menu?(dish)

    quantity.times { @full_order << dish }
    quantity.times { @bill += @menu[dish] }
  end

  def total_correct?
    count = 0
    @full_order.each { |dish| count += @menu[dish] }
    @bill == count 
  end

  def text_confirm
    @text.confirm_order
  end

private
  def on_menu?(dish)
    @menu.has_key?(dish)
  end

end
