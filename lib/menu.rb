class Menu
attr_reader :dishes

   def initialize(dishes)
    @dishes = dishes
   end

  def print
    dishes
  end

end