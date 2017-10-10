class Basket
  MINIMUM_QUANTITY = 1

  attr_reader :selected_items
  
  def initialize(selected_items = Hash.new(0))
    @selected_items = selected_items
  end

  def add_item(item, quantity = MINIMUM_QUANTITY)
    @selected_items[item] += quantity if !!item && quantity > 0
  end

  def remove_item(item, quantity = MINIMUM_QUANTITY)
    return unless item_in_basket?(item)
    return if greater_than_quantity_in_basket?(item, quantity)
    @selected_items[item] -= quantity if quantity > 0 
  end

  def calculate_total
    selected_items.inject(0) { |sum, (item, quantity)| sum + (item.price * quantity) } 
  end

  private
  def item_in_basket?(item)
    selected_items.include?(item)
  end

  def greater_than_quantity_in_basket?(item, quantity)
    selected_items[item] - quantity < 0
  end
    
end
