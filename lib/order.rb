class Order

  attr_reader :selection, :total

  def initialize
    @selection = {}
    @total = 0
  end

  def add_selection(dish,quantity,price)
    @selection.store(dish, quantity)
    add_to_total(quantity,price)
    "Dish added!"
  end

  def format_order
    formatted_order = []
    @selection.each do |dish,quantity|
      formatted_order << "#{dish} x#{quantity}"
    end
    formatted_order
  end

  def format_total
    "Total: #{@total}"
  end

  private

  def add_to_total(quantity, price)
    @total += (quantity * price)
  end
end
