class Menu

  attr_reader :meals

  # @meals should not be hard coded (use file instead)

  def initialize
    @meals = {
      pappadom: 0.50,
      chutney: 0.50,
      samosa: 2.25,
      curry: 6.50,
      grill: 8.95,
      rice: 1.95,
      naan: 1.80
    }
  end

  def print
    i = 1
    @meals.each do |meal, price|
      puts "#{i}. " + meal.to_s + " : £" + sprintf('%.2f', price)
      i += 1
    end
    # format menu to be aligned prettier
  end

  def price(item)
    @meals[item]
  end

end
