class Menu
  attr_reader :items
  def initialize 
    @items = [
              { item: "Margherita", price: 10 },
              { item: "Hawaiin", price: 12 },
              { item: "Pepperoni", price: 11 },
              { item: "Ham and Mushroom", price: 11 }
            ]
  end

  def display
    items.each do |item|
      puts "#{item[:item]} £#{item[:price]}"
    end
  end
  
  def select(selection, quant)
    selected = {}
    items.each do |item|
      if selection == item[:item] 
        selected = { item: item[:item], price: item[:price], quantity: quant }
      end
    end
    selected
  end
end
