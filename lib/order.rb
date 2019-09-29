# order.rb

class Order

  def initialize(sms = Sms.new)
    @items = []
    @total = 0.0
    @sms = sms
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
    return failure_message unless verified
    @sms.send(confirmation_message)
  end

  private
  attr_reader :items

  def update_total(dish)
    @total += dish.price
  end

  def verified
    @authorized_total == @total
  end

  def confirmation_message
    t = Time.now
    eta = "#{t.hour + 1}:#{t.min}"
    "Thank you! You order was placed and will be delivered before #{eta}"
  end

  def failure_message
    "Authorized amount is incorrect, please try again"
  end

end
