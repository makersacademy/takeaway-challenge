require 'menu'
class Order 

  attr_accessor :ordered_dishes, :menu

  def initialize(menu)
    @menu = menu
    @ordered_dishes = {}
    @separate_totals = []
  end

    
  def add(dish, quantity)
    raise "#{dish} is not on the menu." unless menu.has_dish?(dish)
    ordered_dishes[dish] = quantity
   
  end

  def total
    item_totals.inject(:+) #adds the array up
  end


  private

  def item_totals
    ordered_dishes.map do |dish,quantity|
      separate_totals = menu.price(dish) * quantity
      

    end
  end






  



end
