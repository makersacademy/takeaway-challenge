class Order
  def initialize(item)
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

  def delivery_time
    (Time.now + 3600).strftime("%H:%M")
  end
end