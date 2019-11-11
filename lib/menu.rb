class Menu

  attr_reader :items

  def initialize
    @items = { "Daniels's Delicious Chicken" => 12,
               "Eduard's Enviable Eggs" => 19,
               "Mark's Marvellous Lasagne" => 8,
               "Gabriel's Godly Fries" => 25,
               "Maria's Majestic Meatballs" => 24,
               "Rafaela's Round Halloumi" => 39,
               "Sayem's Saucy Fishcakes" => 22,
               "Valeria's Value Milkshake" => 16
     }
  end

  def display
    @items.each_with_index do |(k, v), index|
      puts "#{index + 1}. #{k} £#{v}"
    end
  end
end
