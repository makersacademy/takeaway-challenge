require_relative 'menu'
require_relative 'text'
require_relative 'receipt'

class MenuSelector
  attr_reader :menu, :total, :order, :receipt

  def initialize(menu = Menu.new)
    @menu = menu
    @total = []
  end

  def view_menu
    @menu.menu_list.each do |food, price|
      puts "#{food} - £#{price}"
    end
  end

  def order_food(*order)
    @order = order
    order.each { |o| @total << @menu.menu_list[o.to_sym] }
    @total = @total.sum
  end

  def make_receipt(receipt = Receipt.new(@order, @total))
    @receipt = receipt
    receipt.print_final_receipt
  end

  def pay(user_total, text = Text)
    raise 'That is not the correct amount!' if user_total != @total
    text.new
  end
end
