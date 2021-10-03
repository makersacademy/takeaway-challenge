class Order
  attr_reader :id
  def initialize # inside Order, dishes are referred to as items
    @id = object_id
    @basket = []
  end

  def basket
    @basket.dup
  end

  def add(item)
    @basket << item
  end

  def remove(item)
    @basket.delete(item)
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
