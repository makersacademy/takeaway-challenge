class FormatMenu

  attr_reader :header, :footer

  def initialize
    @header = "Mel's Place"
    @footer = "Hope you enjoy!"
  end

  def format_price(price)
    return "£#{sprintf( '%.2f', price)}"
  end

end
