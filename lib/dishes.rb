# understand what dishes are avilable and what they cost

class Dishes

  attr_reader :dishes

  def initialize
    @dishes = {
      chicken: { name: "Rotisserie chicken",
        price: 14.99,
        quantity: 10
      },
      spinach: {
        name: "Wilted spinach",
        price: 3.50,
        quantity: 80
      }
    }

  end

end
