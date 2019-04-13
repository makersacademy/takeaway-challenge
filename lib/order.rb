class Order

  attr_reader :select_dish, :total_price

  def initialize
    @select_dish = []
    @total_price = 0
  end

  def add_selected_dish(name)
    @select_dish << (name)
    calculate_price
  end

  def calculate_price
    @total_price = 0
    @select_dish.each do |dish|
      @total_price += dish.price
   end
 end

end
