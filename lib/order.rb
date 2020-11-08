require_relative 'menu'
require_relative 'text'

class Order
  attr_accessor :menu, :order, :total, :text
  def initialize
    @order = []
    @total = 0
    @menu = Menu::MENU
    @text = TextConfirm.new
  end

  def add(dish, amount = 1)
    raise "#{dish} is not available" unless dish?(dish)

    amount.times { @order << dish }
    amount.times { @total += @menu[dish] }
  end

  def total_correct?
    balance = 0
    @order.map do |dish|
      balance += @menu[dish]
    end
    @total == balance
  end

  def confirm_order
    @text.confirmation
  end

  private

  def dish?(dish)
    @menu[dish]
  end
end
