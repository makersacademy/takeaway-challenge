module DishPrinter
  def self.see_menu dishes
    dishes.map(&:readable_menu).join("\n")
  end
  def self.see_order dishes
    dishes.map(&:readable_order).join("\n")
  end
  def self.see_total dishes
    total_cost = get_total dishes
    name = "Total"
    result = "\n-----------------\n"
    result += "#{'%-30s' % (name + ":")} £#{'%5.2f' % total_cost}"
    result
  end
  def self.get_total dishes
    dishes.map { |dish| dish.quantity_ordered * dish.price_per_unit }.sum
  end
end
