class Order
  attr_reader :menu, :balance, :dishes, :complete

  def initialize(menu)
    @menu = menu
    @dishes = []
    @balance = 0
    @complete = false
  end

  def add_item(item)
    @dishes << @menu.pick(item)
  end

  def balance
    @balance
  end

  def check_balance

  end

  def complete_order

  end

end
