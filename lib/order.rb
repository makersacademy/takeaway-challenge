#keeps account of order

class Order

  attr_reader :balance

  def initialize(menu)
    @menu = menu
    @order = []
    @balance = 0
  end

  def select(item, quantity)
    @order = {item => quantity}
    add_to_balance(item, quantity)
  end

  def confirm(money)
    if money == @balance
      Messenger.new.send
    else
      p "Incorrect total"
    end
  end

  private

  def add_to_balance(item, quantity)
    quantity.times do
      @balance += @menu[item]
    end
  end

end
