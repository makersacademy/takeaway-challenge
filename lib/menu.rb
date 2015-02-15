class Menu
  attr_reader :dishlist, :ordered

  def initialize
    @dishlist = []
    @ordered = []
  end

  def add_dish(dish)
    @dishlist << dish    
  end

  def custom_order(orders)
   orders.each {|order| @ordered << order}  
  end

end