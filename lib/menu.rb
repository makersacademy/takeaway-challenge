class Menu
  def initialize
    @items = [
      { name: "Korma", price: 8.50 },
      { name: "Jalfrezi", price: 9.00 },
      { name: "Tikka Masala", price: 8.00 }
    ]
  end

  def list_items
    @items.map { |item| "#{item[:name]}: £#{item[:price]}0" }.join("\n")
  end
end
