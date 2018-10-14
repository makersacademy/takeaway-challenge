class Order
  attr_reader :item_list
  def initialize(item_list)
    @item_list = item_list
  end

  def total
    @item_list.reduce(0) do |sum, item|
      sum + item[0].price * item[1]
    end
  end
end
