class PriceCalculator
  attr_reader :selected_dishes, :grand_total
  def initialize(selected_dishes)
    @selected_dishes = selected_dishes
    @grand_total = 0
  end

  def selected_dishes
    @selected_dishes.dup
  end

  def price(selected_dishes)
    selected_dishes.each do |dish,quantity|
      @grand_total += dish.price * quantity
    end
    grand_total
  end
end
