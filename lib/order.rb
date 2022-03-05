class Order
  
  attr_reader :list

  def initialize(menu)
    @menu = menu
    @list = []
  end
  
  def select(dish, quantity)
    quantity.times { @list << @menu.list[dish] }
  end

  def total
    @list.flatten.select{|i|i.is_a? Float}.sum
  end

  def print_receipt
    p @list
    p total: total
  end

end