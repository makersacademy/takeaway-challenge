class Order
  attr_accessor :menu, :order, :total
  def initialize
    @order = []
    @total = 0
    @menu = Menu::MENU
  end

  def add(dish, amount = 1)
    raise "#{dish} is not avialable" unless dish?(dish)

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

  private

  def dish?(dish)
    @menu[dish] ? true : false
  end
end
