class Menu
  attr_reader :items
  def initialize 
    @items = [
              {item: "Margherita", price: 10 },
              {item: "Hawaiin", price: 12}
            ]
  end

  def display
    items.each do |item|
        puts "#{item[:item]} £#{item[:price]}"
    end
  end
  
  def select(selection, quantity)
    selected = {}
    items.each do |item|
      if selection == item[:item] 
        selected = {item: item[:item], price: item[:price].to_i, quantity: quantity.to_i }
      end
    end
    selected
  end
end 