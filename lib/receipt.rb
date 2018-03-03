require_relative 'menu'

class Receipt
  attr_reader :order, :total
  def initialize(order, total, menu = Menu.new)
    @order = order
    @menu = menu
    @total = total
  end

  def header
    "You ordered:"
  end

  def receipt
    @order.each do |food_item|
    "#{food_item} - £#{@menu.menu_list[food_item.to_sym]}"
    end
  end

  def total
    "Your total is #{@total}"
  end

  def print_final_receipt
    header
    receipt
    total
  end
end
