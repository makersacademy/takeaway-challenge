
class  Order

  attr_reader :dishes

  def initialize
    @dishes = {} #Hash.new(0) create new hash with 0 add += quantity in add method
    
  end

  def add(dish, quanitiy) #same two arguments from the add_order method in take_away class
    dishes[dish] = quanitiy # += quanitiy if initialized hash with default (0)
    
  end

end