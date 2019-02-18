class Dishes

  attr_reader :choices

  def initialize
    @dishes = [
      { 'Meal' => 'Pepperoni Pizza', 'Price' => 5, 'Quantity' => 0 },
      { 'Meal' => 'Bang Bang Chicken', 'Price' => 6, 'Quantity' => 0 },
      { 'Meal' => 'Pasta', 'Price' => 4, 'Quantity' => 0 }
    ]
    @dishes_array = []
    @choices = []
  end

  def display
    if @dishes_array == []
      format_dishes
    end
    @dishes_array
  end

  def format_dishes
    @dishes.each { |dish|
      @dishes_array << "#{dish['Meal']} - £#{dish['Price']}"
    }
  end

  def choose(meal_choice, quantity)
    if meal_choice == 'None' && quantity == 0
      @choices
    else
      @dishes.each { |dish|
        if dish['Meal'] == meal_choice
          dish['Quantity'] = quantity
          @choices << dish
        end
      }
      @choices
      choose(meal_choice, quantity)
    end
  end

  private :format_dishes

end
