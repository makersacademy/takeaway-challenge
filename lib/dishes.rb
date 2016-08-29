# understand what dishes are avilable and what they cost

class Dishes

  attr_reader :dishes, :order

  def initialize
    @dishes = {
      chicken: { name: "Rotisserie chicken",
        price: 15,
        quantity: 10
      },
      spinach: {
        name: "Wilted spinach",
        price: 3,
        quantity: 80
      },
      potatoes: {
        name: "Roasted potatoes",
        price: 5,
        quantity: 50
      }
    }

  end

  def available_dishes
    dishes
  end

  def check_sum(list, sum)
    sum == calculate_order_sum(list) ? true : false
  end

  private

  def calculate_order_sum(list)
    sum = 0
    list.each do |item, quantity|
      sum += dishes[item][:price] * quantity
    end
    sum
  end

end
