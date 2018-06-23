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
    @prices = @final_choices.map { |hash| Menu::MENU[hash[:choice]] * hash[:quantity] }
  end

end
