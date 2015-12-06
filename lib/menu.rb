class Menu

  attr_reader :meals

  def initialize
    @meals = {'Bombay Aloo' => 5,
              'Lamb Passanda' => 9,
              'Chicken Tikka Masala' => 8}
  end

  def show
    meals.map {|k,v| "#{k} : £#{v}" }.join("\n")
  end


end
