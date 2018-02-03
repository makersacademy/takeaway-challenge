class Menu

  attr_reader :meals

  def initialize
    @meals = {
      pappadom: 0.50,
      chutney: 0.50,
      samosa: 2.25,
      curry: 6.50,
      tandoori_grill: 8.95,
      veg_side: 2.75,
      rice: 1.95,
      naan: 1.80
    }
  end

end
