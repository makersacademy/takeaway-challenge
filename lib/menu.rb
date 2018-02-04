class Menu

  attr_reader :meals

  # @meals should not be hard coded (use file instead)

  def initialize
    @meals = {
      pappadom: 0.50,
      chutney: 0.50,
      samosa: 2.25,
      curry: 6.50,
      rice: 1.95,
      naan: 1.80
    }
  end

  def print
    i = 1
    @meals.map do |meal, price|
      puts "#{i}. " + meal.to_s + " : £" + sprintf('%.2f', price)
      i += 1
    end
  end

  def price(item)
    @meals[item]
  end

end
