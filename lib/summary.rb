# Summary returns the cost of the final choices

class Summary

  attr_reader :final_choices

  def initialize(final_choices)
    @final_choices = final_choices
  end

  def total(menu = Menu::MENU)
    @prices = @final_choices.map do |selection|
      (menu[selection[:dish]]) * selection[:quantity]
    end
    @prices.sum
  end

  # def total
  #   price_lookup
  #   @prices.sum
  # end
  #
  # def price_lookup
  #   @prices = @final_choices.map do |selection|
  #     Menu::MENU[selection[:dish]] * selection[:quantity]
  #   end
  # end

end
