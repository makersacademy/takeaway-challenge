
class Takeaway
#see a list of dishes with prices
attr_reader :dishes

  def initialize
    @dishes = {
        "Chicken Korma" => 4.50,
        "Veggie Burrito" => 3.00,
        "Fries" => 3.00,
        "Beef Burger" => 7.00,
        "Steak" => 7.00,
        "Kinder Bueno Waffle" => 5.00,
        "Vanilla Ice Cream" => 5.00
      }
    @quantities = 0
    @items_ordered = []
    @price_of_order = []
  end

  def menu(display_dishes)
    display_dishes = @dishes
  end

#see a list of dishes with prices
  def dishes_selection(mydish)
   "Item: #{mydish} costs £#{dishes[mydish]}"
  end

end
