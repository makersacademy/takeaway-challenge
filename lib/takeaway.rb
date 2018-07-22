require_relative 'menu'

class Takeaway 
  attr_reader :menu, :basket, :total 
  def initialize(menu = Menu)
    @menu = menu.new #pass in menu class here. menu.new will boot up any obj. 
    @basket  = []
    @total = 0 
  end
  
  def display_menu 
    @menu.display  
  end 

  def add(dish)
    if menu.items.has_key?(dish) 
    end 
    end 
  end 
 


