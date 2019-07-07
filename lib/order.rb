require 'text_service'

class Order
   attr_reader :basket

  def initialize(text_service = TextService.new)
    @text_service = text_service
    @basket = []
  end

  def add_to_basket(takeaway, index, quantity = 1)
    quantity.times do
      @basket << takeaway.select_item(index)
    end
  end

  def print_basket
    @basket.each { |item|
      puts "#{item[:item]} - £#{item[:price]}"
    }
  end

  def basket_total
    prices = @basket.map { |item| item[:price] }
    prices.sum
  end

  def submit_order(expected_total)
    raise "Total does not match" if basket_total != expected_total
    @text_service.send_text(order_confirmation_message)
    "Confirmation text sent"
  end

  private

  def order_confirmation_message
    one_hours_time = Time.now + (60 * 60)
    "Thank you! Your order was placed and will be delivered before " +
      "#{one_hours_time.strftime("%H:%M")}"
  end
end
