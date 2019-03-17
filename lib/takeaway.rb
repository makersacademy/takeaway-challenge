# require_relative './dish.rb'

class Takeaway

  def initialize
    @takeaway = []
    @total = 0
  end 


  def check_menu(dishes= Dish.new)
    @alldishes = dishes
    # p @dishes

    #@dishes is dishes class
    @alldishes.display_list

  end 

  # def select(meal)
  #   # @alldishes.each do |x|
  #   # if 

  #   # @takeaway << meal


  # end 



end 