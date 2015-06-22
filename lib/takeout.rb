require_relative 'order_calculator'

class Takeout
  include OrderCalculator

  attr_reader :menu
  attr_accessor :total, :order

  def initialize
    @menu = { Pizza: 6,
              Wings: 4,
              Coke: 2,
              Water: 1 }
    @order = []
    @total = 0
  end

  def show_menu
    menu.each do |item, price|
       display_menu = "#{item} " + "£#{price}"
       puts display_menu
     end
  end

  def add_item item, amount = 1
    fail 'Item not on menu' unless on_menu? item
    add_to_order item, amount
    add_to_total item, amount
    self.display_order
  end

  def display_order
     display = "#{order}; Total: £#{total}"
  end

  def pay amount
    fail 'Incorrect payment amount' if amount != total
    response = 'Thank you! You will be receiving a text confirmation shortly!'
  end

end
