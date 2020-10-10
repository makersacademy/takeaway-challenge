class Dishes
  DISHES = [
    { id: "001", item: "Pepperoni Pizza", price: "7.99" },
    { id: "002", item: "Margherita Pizza", price: "7.49" },
    { id: "003", item: "Chips", price: "3.00" },
    { id: "004", item: "Onion Rings", price: "3.50" },
    { id: "005", item: "Diet Coke", price: "2.50" },
    { id: "006", item: "Fanta", price: "2.50" }
  ]

  def select_item(order_id)
    DISHES.select { |item| (item[:id] == order_id) }
  end

  def format_items
    DISHES.map do |item|
      "ID#{item[:id]} - £#{item[:price]} : #{item[:item]}"
    end
  end
end
