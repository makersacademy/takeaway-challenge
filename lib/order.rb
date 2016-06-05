#keeps account of order
require_relative 'messenger'
class Order

  attr_reader :order, :total_price

  def initialize(menu)
    @menu = menu
    @order = {}
    @total_price = 0
  end

  def select(item, quantity)
    fail "#{item.capitalize} is not on the menu." unless @menu.include?(item)
    @order.include?(item) ? @order[item] += quantity : @order[item] = quantity
    add_to_balance(item, quantity)
  end

  def confirm(amount)
    amount == @total ? Messenger.new.send : print {"Incorrect Total"}
  end

  private

  def add_to_balance(item, quantity)
    quantity.times do
      @total_price += @menu[item]
    end
  end
end
