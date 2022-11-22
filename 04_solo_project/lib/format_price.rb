module FormatPrice
  def format_price(price)
    "£#{format '%.2f', price}"
  end
end
