require_relative 'order'
require_relative 'menu'

class Takeaway

attr_reader :order

def initialize (order_class = Order)
  @order = order_class.new
end

    def complete_order(total)
      raise "Sorry that does not match the total" if @order.total_bill != total
      send_text("Thank you for your order")
    end

    def send_text(message)
      "#{message}"
    end

end