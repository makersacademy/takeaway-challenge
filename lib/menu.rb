class Menu

  # For whoever is code reviewing this - I shamelessly stole these dishes from one
  # of my fav restaurants - Rasa in Stoke Newington, I highly recommend it if you're ever in the area.
  
  def initialize(dish_class=Dish)
    @dishes = [
      { name: "Rasam", price: 5 }, 
      { name: "Plain Dosa", price: 6 }, 
      { name: "Masala Dosa", price: 7 }, 
      { name: "Rasavangi", price: 7.5 }, 
      { name: "Plain Rice", price: 3 }, 
      { name: "Tamarind Rice", price: 3.5 }, 
      { name: "Mango Halwa", price: 4 }
    ]
  end

  def view
    @dishes.each { |x| print "#{x[:name]}, £#{x[:price]}"+ "\n" } 
  end

end