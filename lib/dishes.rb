class Dishes
attr_accessor :dishes
  def initialize(dishes)
    @dishes = dishes
  end

  def list
     @dishes
  end
end
