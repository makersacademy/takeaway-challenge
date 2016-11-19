require './lib/takeaway.rb'

#Manages the customers actions
class Customer

attr_reader :takeaway

  def initialize(takeaway_klass)
    @takeaway = takeaway_klass.new
  end

  def view_takeaway_dishes
    takeaway.all_dishes
  end

  def select(dish, quantity)
    #takeaway.selected_dishes << takeaway.all_dishes[dish] quantity
  end

  def check_order
    []
  end

end
