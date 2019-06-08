module ItemPrinter

  def self.print(item)
       "#{item.keys[0].name} x #{item.values[0]} = £#{single_dish_price(item)}"
  end

  private

  def self.single_dish_price(item)
    item.keys[0].price.to_f * item.values[0]
  end
end