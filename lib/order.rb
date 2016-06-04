#keeps account of order

class Order

  def initialize(menu)
    @menu = menu
    @order = []
    @total = 0
  end

  def select(item, quantity)
    @order << {item => quantity}
    add_to_balance(item, quantity)
  end

  def confirm(money)
    money == @total ? Messenger.new.send : print {"Incorrect Total"}
  end

  private

  def add_to_balance(item, quantity)
    quantity.times do
      @total += @menu[item]
    end
  end

end
