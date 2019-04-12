class Menu

  attr_reader :dishes

  def initialize
    @dishes = [{ name: "pizza", price: 6.00 },
      { name: "pasta", price: 6.50 },
      { name: "chips", price: 3.00 },
      { name: "halloumi fries", price: 5.50 },
      { name: "calamari", price: 7.00 },
      { name: "bruschetta", price: 3.50 }]                             
  end

end
