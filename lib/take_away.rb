class TakeAway
  attr_reader :dish, :selected_dishes, :quantity

  def initialize
    @dish = [
      { "fried chicken" => 7.00 },
      { "plain rice" => 2.00 },
      { "steamed vegetables" => 4.50 },
      { "cheese cake" => 3.50 }
    ]
  end

  def list
    @dish.each do |key, value|
      "#{key}-£ #{value}"
    end
  end

  def select_dishes(dish_name, quantity)
    @dish.each do |dish|
      raise "Selected dish not available" unless dish.key?(dish_name)
      @quantity = quantity
      @selected_dish = []
      @quantity.times do
        @selected_dish << dish_name
      end
    end
  end

end
