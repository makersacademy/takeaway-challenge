# order.rb

class Order

  def initialize
    @items = []
    @total = 0.0
  end

  def add(dish, quantity)
    quantity.times do
      items << dish
      update_total(dish)
    end
  end

  def print_total
    "%.2f" % @total
  end

  def review
    items.collect do |item|
      "#{item.name} #{"%.2f" % item.price}"
    end
  end

  def place(authorized_total)
    @authorized_total = authorized_total
    return "Authorized amount is incorrect, please try again" unless verified
    t = Time.now
    eta = "#{t.hour + 1}:#{t.min}"
    "Thank you! You order was placed and will be delivered before #{eta}"
  end

  private
  attr_reader :items

  def update_total(dish)
    @total += dish.price
  end

  def verified
    @authorized_total == @total
  end

end
