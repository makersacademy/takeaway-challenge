class Menu

  def initialize
    @food = [ ["pasta", 10 ], [ "pizza", 40 ], [ "spaghetti", 200 ] ]
  end

  def list
    @food.dup
  end
end
