class Order

  DEFAULT_QUANTITY = 1

  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add(dish, quantity = DEFAULT_QUANTITY)
    quantity = @basket[dish] + quantity if @basket[dish]
    @basket[dish] = quantity
  end

  def remove(dish)
    fail 'Dish not in basket' if !@basket[dish]
    quantity = @basket[dish]
    if quantity > 1
      @basket[dish] = quantity-1
    else
      @basket.delete(dish)
    end
  end

  def view
    @basket.each do | dish, quantity|
      puts "#{quantity}x #{dish.name} = #{dish.price * quantity}"
    end
  end

  def total
    total = 0
    basket.each do |dish, quantity|
      total += dish.price * quantity
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
