class Orders
  attr_accessor :items, :order_list, :prices

  def initialize
    @items = Items.new
    @items = items.list
    @order_list = []
    @prices = []
  end

  def print_menu
    puts "Feed your soul. Books delivered:"
    items
  end

  def place_order item 
    order_list << item
    p order_list
  end

  # this is to run the checks without IRB interaction (if the checks were working)
  # def order_complete?
  #   pull_prices
  #   total_price
  # end

  def pull_prices
    order_list.each do |item|
      prices << items[item]
    end
    p prices
  end

  # this isn't working and has defeated me
  def total_price
    p prices
    total_price = prices.inject do |result, element|
      total_price << result + element 
    end
    p total_price
  end

end
