class Menu

  attr_reader :menu

  def initialize
    @menu = [
      { dish: "Wonton soup", price: 2.40 },
      { dish: "Spring rolls", price: 4.50 },
      { dish: "Spare ribs", price: 4.80 },
      { dish: "Crispy duck", price: 13.50 },
      { dish: "Special fried rice", price: 5.10 },
      { dish: "Chicken chow mein", price: 4.60 },
      { dish: "Prawn chop suey", price: 5.30 },
      { dish: "Kung Pao chicken", price: 4.70 },
      { dish: "Sweet and sour pork", price: 4.50 },
      { dish: "Beef black bean", price: 4.70 },
      { dish: "Chips", price: 1.40 }
    ]
  end

  def print_menu
    number = 1
    @menu.each do |item|
      puts "#{number}. #{item[:dish]} - £#{'%.2f' % item[:price]}"
      number += 1
    end
  end

end
