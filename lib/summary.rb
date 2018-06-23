# Summary returns the total cost of the final choices
class Summary

  attr_reader :final_choices

  def initialize(final_choices)
    @final_choices = final_choices
  end

  def total
    price_lookup
    @prices.sum
  end

  private

  def price_lookup
    @prices = @final_choices.map do |selection|
      Menu::MENU[selection[:dish]] * selection[:quantity]
    end
  end

end
