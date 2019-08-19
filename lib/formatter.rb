module Formatter
  def format_price(price)
    sprintf("£%.2f", price)
  end
end
