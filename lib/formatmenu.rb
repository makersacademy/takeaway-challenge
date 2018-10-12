class FormatMenu

  attr_reader :header

  def initialize
    @header = "Mel's Place"
  end

  def format_price(price)
    return "£#{sprintf( '%.2f', price)}"
  end

end
