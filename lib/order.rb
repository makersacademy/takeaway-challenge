require_relative 'menu'

class Order

  attr_reader :order, :item_selected

  def initialize
    @order = []
  end

  def add(item_selected)
    @order << item_selected
  end

  def delete(item_number)
    @order.delete_if do |item|
      item.each do |dish, _price|
        dish.start_with?(item_number.to_s)
      end
    end
  end

end
