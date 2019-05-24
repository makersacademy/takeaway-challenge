class Order
  attr_reader :ordered_items, :total
  def initialize
    @ordered_items = []
    @total = 0
    @menu_dishes = { :pizza => 4.00, :sausage => 2.00, :curry => 6.50, :rice => 2.00, :chilli => 6.00, :salad => 3.50 }
  end

  def select_dishes(item_chosen)
    @ordered_items.push(item_chosen)
    @total += @menu_dishes[item_chosen]
  end

  def price
    @total
  end

  def text_order_confirmation
    if !@ordered_items.empty? && @total > 0
      return "Thank you! Your order was placed and will be delivered before 18:52"
    else
      return "Order incomplete"
    end
  end

end