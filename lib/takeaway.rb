class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = { :dish1 => 1,
              :dish2 => 2,
              :dish3 => 3,
              :dish4 => 4 }
  end

  def place_order(order)
    self.order = order
    calculate_price(order)
  end

  private

  attr_writer :order

  def calculate_price(order)
    total = 0
    order.each do |item, quantity|
      total += (quantity * @menu[item])
    end
    total
  end
end