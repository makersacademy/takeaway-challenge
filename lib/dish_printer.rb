module DishPrinter

  def pretty_print(options = {})
    "Dish#%<id>i: %<name>s (£%<price>.2f)" %
    { id: options[:id], name: options[:name], price: options[:price] }
  end
end
