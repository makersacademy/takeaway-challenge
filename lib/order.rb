class Order
  attr_reader :user
  def initialize(user)
    @user = user
  end

  def add_item(item)
    @items << item
  end

  def remove_item(item)
    fail "#{item} not ordered" if !@items.include?(item)
    @items.delete(item)
    "One #{item} has been removed from your order"
  end
  
  def total
    total = 0
    @items.each do |i|
      total += i.price
    end
    price
  end
  
  def delivery_time

  end
end