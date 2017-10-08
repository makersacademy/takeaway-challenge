require_relative 'dish'

class OrderedDish < Dish
  def readable
    "#{'%-30s' % (name + ":")} £#{'%5.2f' % (quantity_ordered * price_per_unit)}"
  end
end
