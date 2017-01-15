class Order
  attr_reader :ordered

  def initialize
    @ordered = []
  end

  def add(order, menu)
    order_array = []
    order_array = order.split(",").map(&:to_i)
    order_array.each do |x|
      menu.each_with_index { |val, index|
        if (x - 1 == index)
          @ordered << val
        end
      }
    end
    @ordered
  end

  def basket
    raise "No Dishes Selected: Please add a dish to your order" if @ordered.empty?
    @ordered
  end

  def total
    total_basket = 0
    @ordered.each do |x|
      total_basket = total_basket + x[:price]
    end
    @total_basket
    return "Your total - £#{total_basket}"
  end

  def checkout
    sms_messager.message("Your order is confimed and will be ordered before #{time_in_one_hour}")
    @ordered
  end

end
