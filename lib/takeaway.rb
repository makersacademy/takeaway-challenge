# Understands managing orders
class Takeaway
  def initialize
    @order = {}
  end

  def check_basket
    @order
  end

  def total
    "£#{format('%.2f', 0.00)}"
  end
end
