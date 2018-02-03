class Order

  attr_reader :list_of_items

  def initialize
    @list_of_items = []
  end

  def add_items(name, price, amount)
    @list_of_items << {name: name, price: price, amount: amount}
  end

  def see_final_order
    puts "You have ordered:"
    # policz według names ilość i łączną price 
  end

end
