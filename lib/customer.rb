require_relative 'takeaway'

class Customer 

attr_reader :basket

  def initialize(takeaway = Takeaway) 
    @basket = []
    @takeaway = takeaway.new
  end 

  def view(takeaway)
    takeaway.view
  end 

  def add(dish)
    a = dish.to_sym
    @basket << @takeaway.menu.select {|k| k == a}
  end 

end 