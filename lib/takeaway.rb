class TakeAway

  attr_reader :basket, :total

  def initialize(dish_class=Dish)
    @dish_class = dish_class
    @basket = Array.new
    @total = Array.new
  end

  def list_menu
    menu = {
        "Bratwurst in a bun" => 2.49,
        "Bockwurst in a bun" => 2.49,
        "Käsekrainer in a bun" => 2.79,
        "Veggie sausage in a bun" => 2.29,
        "Sauerkraut" => 1.19,
        "Crispy onions" => 0.29,
        "Mustard" => 0.29,
        "Ketchup" => 0.29,
        "Sidesalad" => 0.75,
        "Orange juice" => 1.49,
        "Weißbier" => 2.99,
        "Schwarzbier" => 2.99
      }
  end

  def add_to_basket(name,quantity)
    price = self.list_menu[name]
    @basket << @dish_class.new(name,price,quantity)
  end

  def total()
    # @basket
  end



end

# class BasketItem
#   attr_reader :price,:quantity
#   def initialize(price,quantity)
#     @price = price
#     @quantity = quantity
#   end
# end
