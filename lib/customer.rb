require_relative 'takeaway'

class Customer 

attr_reader :basket, :takeaway

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

  def total
    sum = 0 
    @basket.each { |hash| hash.each_value {|v| sum += v}}
    sum
  end 

end 