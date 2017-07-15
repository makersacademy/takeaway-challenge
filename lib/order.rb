class Order

attr_reader :basket

  def initialize(item, quantity = 1, price)
      @basket = [{:dish => item, :quantity => quantity, :price => price}]
  end

  def add(item, quantity = 1, price)
      store_ordered_items(item, quantity, price)
      return "#{quantity} x #{item}, costing £#{quantity*price} have been added to your order"
  end

private
  def store_ordered_items(item, quantity, price)
      @basket << { :dish => item, :quantity => quantity, :price => price }
  end

end
