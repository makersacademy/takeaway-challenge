class Bill

  def initialize(menu = Menu.new)
    @menu  = menu
  end

  def total_bill(order)
    total = 0
    order.items.inject(0){|total,item| total + (item.quantity.to_i * get_price_of_item(item.name).to_i)}
  end

  private

  def get_price_of_item(name)
    selected_items = @menu.items.select {|item| item.name.include? name}
    selected_items.last.price
  end

end
