class Dish
  attr_reader :description, :price
  def initialize(menu_number, description, price, available = true)
    @menu_number = menu_number
    @description = description
    @price = price.to_f
    @available = available
  end

  def display
    if available?
      "#{@menu_number}. #{@description} £#{@price}"
    else
      "Dish unavailable"
    end
  end

  def make_unavailable
    @available = false
  end

  private
  def available?
    @available
  end
end
