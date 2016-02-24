class PriceCalculator
  attr_reader :selected_dishes, :grand_total, :server, :subtotals
  def initialize(server)
    @grand_total = 0
    @server = server
    @subtotals = []
  end

  def selected_dishes
    @selected_dishes.dup
  end

  def subtotals
    @subtotals.dup
  end

  def price(selected_dishes)
    @selected_dishes = selected_dishes
    selected_dishes.each do |dish,quantity|
      @grand_total += dish.price * quantity
      @subtotals << [dish.name, dish.price, quantity, quantity * dish.price]
    end
    raise "Grand Total incorrect." if grand_total != server.total
    grand_total
  end
end
