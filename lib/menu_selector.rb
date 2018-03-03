require_relative 'menu'
require_relative 'text'
require_relative 'receipt'

class MenuSelector
  attr_reader :menu, :total, :orders

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
    @order.each do |food_item|
      @total << @menu.menu_list[food_item.to_sym]
    end
  end

  def pay(user_total, text = Text)
    raise 'That is not the correct amount!' if user_total != @total.sum
    text.new
    make_receipt
  end

  def make_receipt(receipt = Receipt)
    @receipt = receipt
    receipt.new(@order, @total)
    @receipt.print_final_receipt
  end
end
