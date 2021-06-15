class Menu

  attr_reader :menu

  def initialize
    @menu = [{ dish: "Edamame", price: 3.95 },
             { dish: "Miso Soup", price: 4.95 },
             { dish: "Sake Sashimi", price: 7.95 },
             { dish: "Toro Sashimi", price: 8.95 },
             { dish: "Salmon and Avocado Roll", price: 9.95 },
             { dish: "Spicy Tuna Roll", price: 11.95 },
             { dish: "Toro Dragon Roll", price: 14.95 }]
  end

  def print
    @menu.each { |dish| puts "#{@menu.index(dish) + 1}. #{dish[:dish]} £#{dish[:price]}" }
  end
end
