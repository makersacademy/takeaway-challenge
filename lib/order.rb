class Order

attr_reader :ordered

def initialize
  @ordered = []
end

    def order(order, show_menu)
    order_array = []
    order_array = order.split(",").map(&:to_i)
    order_array.each do |x|
      show_menu.each_with_index { |val, index|
            if (x-1 == index)
            @ordered << val
          end
        }
      end
      @ordered
    end

  def current_order
    raise "No items on menu selected, please add a dish to your order" if @ordered.empty?
    @ordered
  end

  def current_total
    current_total = 0
    @ordered.each do |x|
      current_total = current_total + x[:price]
    end
    @current_total
    return "Your total is: £#{current_total}"
  end

  def checkout_order
    puts "Your order has been placed and will be with you shortly!"
    @ordered
  end

end
