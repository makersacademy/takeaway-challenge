class Customer 

attr_reader :basket

  def initialize 
    @basket = []
  end 

  def view(takeaway)
    takeaway.view
  end 

  def add(dish)
    @basket << dish
  end 

end 