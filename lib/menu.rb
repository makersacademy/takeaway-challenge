class Menu


  def initialize
    @list_of_items  # => nil
  end

  def list_of_items
    @list_of_items = { :naan => 0.99, :daal => 3.00, :rice => 1.99 }  # => {:naan=>0.99, :daal=>3.0, :rice=>1.99}, {:naan=>0.99, :daal=>3.0, :rice=>1.99}, {:naan=>0.99, :daal=>3.0, :rice=>1.99}
  end

  def order(item, quantity)
    @list_of_items[item]                                                          # => 0.99, 1.99
    puts "Thank you for ordering #{quantity} x #{item}, costing £#{list_of_items.fetch(item)} each"  # => nil, nil
  end

end


menu = Menu.new     # => #<Menu:0x007fc42a875758>
menu.list_of_items  # => {:naan=>0.99, :daal=>3.0, :rice=>1.99}
menu.order(:naan, 5)   # => nil
menu.order(:rice,2)   # => nil

# >> Thank you for ordering naan, costing £0.99
# >> Thank you for ordering rice, costing £1.99
