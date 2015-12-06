class Order

  DEFAULT_QUANTITY = 1

  attr_reader :basket

  def initialize
    @basket = Hash.new
  end

  def add(item, quantity = DEFAULT_QUANTITY)
    quantity = @basket[item] + quantity if @basket[item]
    @basket[item] = quantity
  end

  def remove(item)
    fail 'Item not in basket' if !@basket[item]
    quantity = @basket[item]
    if
      quantity > 1
    then
      @basket[item] = quantity-1
    else
      @basket.delete(item)
    end
  end

  def total
    total = 0
    basket.each do |item, quantity|
      total += item.price * quantity
    end
    total
  end

  def confirm
    "Thank you! Your order was placed and will be delivered by #{delivery_time}"
  end

private
  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

end
