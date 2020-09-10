class Menu 
  attr_reader :food_items
  def initialize
    @food_items = [
      { food: "vinegar yogurt", price: 3 },
      { food: "pickled crumpets", price: 6 },
      { food: "tomato ice-cream", price: 2 },
      { food: "crispy mango", price: 9 },
      { food: "duck ragu", price: 4 },
      { food: "chilli con potato", price: 12 },
      { food: "roadkill jumbalaya", price: 7 },
      { food: "fermented orange", price: 8 },
      { food: "stawberry lasagne", price: 20 },
      { food: "tuna", price: 15 }
    ]
  end
  
  def print
    @food_items
  end
end
