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
    @text_service.send_text("Thank you...")
    "Confirmation text sent"
  end
end
