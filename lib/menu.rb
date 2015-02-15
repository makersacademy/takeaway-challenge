class Menu
  attr_reader :dishlist, :ordered

  def initialize
    @dishlist = []
    @ordered = []
  end

  def add_dish(dish)
    @dishlist << dish    
  end

  def custom_order(orders, total)
   if total == orders.length
        orders.each {|order| @ordered << order}
      else raise 'Please check the sum of your ordered dishes'
    end
  end

end