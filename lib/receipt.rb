require_relative 'menu'

class Receipt
  attr_reader :order, :total
  def initialize(order, total, menu = Menu.new)
    @order = order
    @menu = menu
    @total = total
  end

  def print_header
    "You ordered:"
  end

  def print_receipt
    @order.each do |food_item|
      "#{food_item} - £#{@menu.menu_list[food_item.to_sym]}"
    end
  end

  def print_total
    "Your total to pay is #{@total.sum}"
  end

  def print_final_receipt
    puts print_header
    puts print_receipt
    puts print_total
  end
end
