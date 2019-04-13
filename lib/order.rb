class Order

  attr_reader :select_pizza, :total_price

  def initialize
    @select_pizza = []
    @total_price = 0
    @successful = false
  end

  def add_selected_pizza(name)
    @select_pizza << (name)
    calculate_price
  end

  def confirm_order?
    @successful
  end

  def confirm_order
    @successful = true
  end

  def display_pizzas
   @select_pizza.each do |pizza|
     puts pizza[:name]
   end
  end

  private

  def calculate_price
    @total_price = 0
    @select_pizza.each do |pizza|
      @total_price += pizza[:price]
    end
  end
end
