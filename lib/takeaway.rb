class Takeaway 

  def initialize(menu)
    @menu = menu
  end 

  def see_menu
    @menu
  end 

  def order(food)
    @food = food
    true 
  end 

  def total
    #how to retrieve food in the order. Get food variable. Iterate, price x quantity
    # map will return an array with transformed values of the result of the block
    # each will not return anything, you have to save it
    # extract the prices from the menu item, using the food order, match with menu to get price
    total = 0
    # food |element| iterate through menu

    @food.each do | element |
      price =  @menu.select {|dish| element[:item] == dish[:item]}.first[:price]
      total += price * element[:quantity]
    end 
    total
  end 
end 