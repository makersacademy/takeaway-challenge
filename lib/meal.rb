
class MealItem
  attr_reader :price, :description, :item
  def initialize(item,price,description = nil)
    @item = item
    @price = price
    @description = description
  end

  def add_description(desc_string)
   @description = desc_string
  end

  def change_price(price_string)
   @price = price_string
  end

end
