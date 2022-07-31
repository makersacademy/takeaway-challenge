class Takeaway
  attr_reader :menu, :my_order

  def initialize 
    @menu = [
      { name: "Beef curry", price: 12 },
      { name: "Fish curry", price: 14 },
      { name: "Lamb curry", price: 10 },
    ]
    @my_order = []
  end

  def dishes

    menu_list = ""
    @menu.each do |item|
      item_name = item[:name]
      item_price = item[:price]
      menu_list += "#{item_name}: £#{item_price} "
    end
    # .strip is used to remove last trailing white space on printed string
    return menu_list.strip
  end

  def add_to_order(order)
    @menu.each do |item|
      if item.has_value?(order)
        @my_order << item
      end
    end

    return @my_order
  end

  def basket_total
    total_cost = 0
    cost_array = []
    @my_order.each do |item|
      cost_array << item[:price]
    end
    return cost_array.sum
  end
end
