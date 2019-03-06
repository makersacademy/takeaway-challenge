class Menu

  attr_reader :dish

  DEFAULT_MENU = { margherita: 8, romana: 10, four_cheese: 12, seafood: 14, garlic_bread: 5 }

  def initialize (dish=DEFAULT_MENU)
    @dish = dish.sort
  end

  def read
    @dish.to_h
  end

  def print
    display = self.read.each{ |key, value|
      puts "#{key} £#{value}"}  # tested in Repl
  end

end
