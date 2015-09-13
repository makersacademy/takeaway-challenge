class Menu

  attr_reader :basket, :list_of_items

  def initialize
    @list_of_items = { :naan => 1.00, :daal => 3.00, :rice => 2.00 }  # => {:naan=>1.0, :daal=>3.0, :rice=>2.0}
    @basket = []                                                      # => []
    @subtotal = []                                                    # => []
  end

  def order(item, quantity)
    not_on_menu?(item,quantity)
    @quantity = quantity
    @price = list_of_items.fetch(item)
    @list_of_items[item]
    puts "Thank you for ordering #{quantity} x #{item}, costing £#{list_of_items.fetch(item)} each"  # => nil, nil
    @basket << [item, list_of_items.fetch(item),quantity]                                            # => [[:naan, 1.0, 3]], [[:naan, 1.0, 3], [:rice, 2.0, 2]]
    @subtotal << list_of_items.fetch(item)*quantity                                                  # => [3.0], [3.0, 4.0]
  end

  def basket_price
    @basket_price = @subtotal.inject(:+).round(10)  # => 7.0
  end

  private
  
  def not_on_menu?(item,quantity)
    raise "Item not on menu" unless @list_of_items.has_key?(item)
  end

end

#
# menu = Menu.new       # => #<Menu:0x007fec0a90f530 @list_of_items={:naan=>1.0, :daal=>3.0, :rice=>2.0}, @basket=[], @subtotal=[]>
# menu.list_of_items    # => {:naan=>1.0, :daal=>3.0, :rice=>2.0}
# menu.order(:naan, 3)  # => [3.0]
# menu.order(:rice, 2)  # => [3.0, 4.0]
# menu.basket           # => [[:naan, 1.0, 3], [:rice, 2.0, 2]]
# menu.basket_price     # => 7.0

# >> Thank you for ordering 3 x naan, costing £1.0 each
# >> Thank you for ordering 2 x rice, costing £2.0 each
