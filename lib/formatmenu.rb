class FormatMenu

  def format_price(price)
    return "£#{sprintf( '%.2f', price)}"
  end

end
