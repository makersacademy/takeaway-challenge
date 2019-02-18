class Dishes

  attr_reader :choices, :meal, :quantity

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

  def choose
    ask_choice
    if @meal == 'none'
      @choices
    else
      @dishes.each { |dish|
        if dish['Meal'] == @meal
          dish['Quantity'] = @quantity
          @choices << dish
        end
      }
      choose
    end
  end

  def ask_choice
    puts 'Choose a meal'
    @meal = gets.chomp
    puts 'Choose a quantity'
    @quantity = gets.chomp.to_i
  end

  private :format_dishes, :ask_choice

end
