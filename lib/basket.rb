class Basket
  require File.dirname(__FILE__) + '/defaults'
  attr_reader :selected_items
  
  def initialize(selected_items = Hash.new(0))
    @selected_items = selected_items
  end

  def add_item(item, quantity = Defaults::MINIMUM_QUANTITY)
    @selected_items[item] += quantity if !!item && quantity > 0
  end

  def remove_item(item, quantity = Defaults::MINIMUM_QUANTITY)
    @selected_items[item] -= quantity if !!item && (selected_items[item] - quantity) >= 0 
  end

  def calculate_total
    total = 0
    selected_items.each { |item, quantity| total += item.price * quantity }
    total
  end
end
