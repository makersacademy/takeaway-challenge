
class Takeaway
#see a list of dishes with prices
attr_reader :dishes

  def initialize
    @dishes = [
      4.50 => ["Chicken Korma","Chicken Katsu Curry"],
      3.00 => ["Veggie Burrito","Fries"],
      7.00 => ["Beef Burger", "Steak"],
      5.00 => ["Kinder Bueno Waffle", "Vanilla Ice Cream"]
    ]
  end

  def dishes_selection(mydish)


  end

end
