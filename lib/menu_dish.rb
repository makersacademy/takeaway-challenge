require_relative 'dish'

class MenuDish < Dish
  def readable
    "#{'%-30s' % (name + ":")} £#{'%5.2f' % price_per_unit}"
  end 
end
