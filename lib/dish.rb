class Dish
  def initialize(menu_number, description, price, available = true)
    @menu_number = menu_number
    @description = description
    @price = price
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

  def price
    @price
  end

  private
  def available?
    @available
  end
end
