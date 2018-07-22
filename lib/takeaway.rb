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

  def add(num=1,dish)
    if menu.items.has_key?(dish)
      num.times{@basket << {dish => menu.items[dish]}}
      "added to basket!"
    else "This dish is not on the menu"
    end 
    end 
  end 
 


