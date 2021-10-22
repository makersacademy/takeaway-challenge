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

  def add_to_order(item)
    if @menu.include?(item)
      @my_order << item
    end
    return my_order
  end
end
