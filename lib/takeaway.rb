# require_relative 'printer'

class Takeaway
    attr_reader :basket, :printer
  def initialize(printer = Printer.new)
    @dishes = [
      {'Guacamole': 2},
      {'Nachos': 5},
      {'Tacos': 5},
      {'Quesadillas': 6},
      {'Taquitos': 10}, 
      {'Tostada': 4},
      {'Burrito': 8},
      {'Patatas Bravas': 5}
    ]
    @basket = Hash.new(0)
    @printer = printer
  end

  def print_dishes
    @dishes
  end

  def display_menu
    @dishes.each { |dish, price|
      "#{dish}: #{price}"
    }
  end

  def add_dish(dish, amount = 1)
    basket[dish] = amount
    "#{amount}x #{dish}(s) added to your basket."
  end

  def price(dish)
    price = @dishes[dish]
  end


  def item_totals 
    @basket.map { |dish, amount| 
      price(dish) * amount
    }
  end

  def order_total
    total = basket.map { |dish, amount|
      price(dish) * amount
    }
    total.sum
  end

  def basket_summary
    @basket
  end




end