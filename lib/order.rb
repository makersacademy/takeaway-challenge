class Order
  attr_reader :total_price, :takeaway_class, :final_order
  
  def initialize(takeaway_class)
    @takeaway_class = takeaway_class
    @final_order = []
    @menu = takeaway_class.menu_class
  end

  def item_selection(no_items, item)
    item_total = item_calculator(no_items, item)
    @final_order << { no_items: no_items, item: item, item_total: item_total }
  end

  def item_calculator(no_items, item)
    p item
    price_array = @menu.full_list.select { |x| x[:item] == item }
    price = price_array[0][:price]
    item_total = no_items * price
  end
end
