class Takeaway

  def initialize
    @menu = [
      { item: "Pizza", price: 6 },
      { item: "Fried chicken", price: 4 },
      { item: "Cheeseburger", price: 5 },
      { item: "Chips", price: 3 }
    ]
  end

  def print_menu
    @menu.each { |item|
      puts item_to_string(item)
    }
  end

  def select_item(index)
    @menu[index]
  end

  private

  def item_to_string(menu_item)
    "#{menu_item[:item]} - £#{menu_item[:price]}"
  end
end
