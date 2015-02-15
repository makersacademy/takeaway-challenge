class Menu
  attr_reader :dishlist

  def initialize
    @dishlist = []
  end


  def add_dish(dish)
    @dishlist << dish    
  end

end