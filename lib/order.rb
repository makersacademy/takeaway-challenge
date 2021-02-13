class Order
  attr_reader :menu, :balance, :dishes, :complete

  def initialize(menu)
    @menu = menu
    @dishes = []
    @balance = 0
    @complete = false
  end

  def add_item(item)
    fail "this order is closed" if @complete == true
    @dishes << @menu.pick(item)
    @balance += @dishes.last.price
  end

  def balance
    @balance
  end

  def check_balance

  end

  def complete_order
    @complete = true
  end

end
