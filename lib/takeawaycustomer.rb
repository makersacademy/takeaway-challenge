class TakeawayCustomer
  attr_reader :name, :number, :menu, :selections
  def initialize(name, number)
    @name = name
    @number = number
    @menu = Menu.new
    @selections = Hash.new
  end

  def list
    @menu.menu
  end

  def order(item)
    if @selections.has_key?(item)
      @selections[item] += 1
    else
      @selections.store(item,1)
    end
  end
end

# menu = Menu.new
# menu.items #=> {stuff}
#
# order = Order.new
# order.list # => {F&C => 1}




# cust.order('F&C')
# cust.order('F&C')
# cust.selections # => {F&C => 2}

# cust.order('F&C')
# cust.order('Burgers')
# cust.selections # => {F&C => 1, Burgers => 1}
#
# order.total
