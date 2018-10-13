require "./lib/pricemanager.rb"
class Dish

  attr_reader :name, :category

  def initialize(name = "MaiThai", category = "drink", price = PriceManager.new)
    @name = name
    @category = category
    @price = price.get_dish_price(@category)
  end

  def publish_dish
    "In category: "<<@category<<" dish - "<<@name<<" cost - "<< @price.to_s
  end

  def getname()
    @name
  end
end
