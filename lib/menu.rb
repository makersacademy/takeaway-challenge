class Menu

  attr_reader :order

  def initialize
    @order = []
    @prices = []
  end

  def menu_list
      @menu_list = [
      [1,"Roast Duck in Sour Plum Sauce", 6.2],
      [2,	"Sweet & Sour Chicken Hong Kong Style",	5.4],
      [3, "Beef Curry",	5.2],
      [4, "Cha Siu Cantonese Roast Lean Pork", 5.5],
      [5, "King Prawns with Green Pepper in Black Bean Sauce", 6.5],
      [6, "Special Chow Mein", 5.7],
      [7, "Egg Fried Rice", 2.8],
      [8, "Steamed Mussels in Black Bean Sauce", 6.5],
      [9, "Crispy Pork in Garlic and Honey Sauce", 5.5],
      [10,	"Chicken with Cashewnuts & Pineapple", 5.4],
      [11,	"Shrimps Foo Yung", 5.2]
    ]
  end

  def item(number)
    @menu_list = menu_list
    @choice = menu_list.slice(number-1)
    @prices << @choice.last
    @order << @choice
  end

  def total
    @order = order
  end

  def prices
    @prices
    @prices.sum.round(2)
  end

end

#"Thank you! Your order was placed and will be delivered before 18:52"
