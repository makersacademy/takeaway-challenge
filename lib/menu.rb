class Menu
  def initialize
    @items = [
      { name: "Korma", price: 8.50 },
      { name: "Jalfrezi", price: 9.00 },
      { name: "Tikka Masala", price: 8.00 }
    ]
  end

  def list_items
    @items.map do |item| 
      dish = item[:name]
      cost = item[:price]
      "#{dish}: £#{cost}0"
    end.join("\n")
  end
end
