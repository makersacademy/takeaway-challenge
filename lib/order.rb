class Order
  attr_reader :id
  def initialize(item) # inside Order, dishes are referred to as items
    @id = self.object_id
    @basket = item
  end

  def basket
    @basket.dup
  end

  def add(item)
    @basket << item
  end

  def total
    @basket.sum(&:price)
  end

  def clear_basket
    @basket = []
  end

  def delivery_time
    (Time.now + 3600).strftime("%H:%M")
  end
end